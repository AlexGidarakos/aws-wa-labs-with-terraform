#!/usr/bin/env bash
cd $(dirname "$0")
source init.inc.sh

# Section start: function definitions
# Logging function with ISO8601 timestamps and severity level support
function Log () {
  if [[ $# -eq 1 ]]; then
    EVENT="[INFO] $1"
  elif [[ $# -eq 2 ]]; then
    EVENT="[$1] $2"
  fi

  echo $(date +%Y-%m-%dT%H:%M:%S.%3N%:z) $EVENT
}

# Check if required binaries are present/in the PATH variable
function check_requirements {
  Log "Checking existence of required binaries: $REQUIREMENTS"
  NOTFOUND="false"

  for i in $REQUIREMENTS; do
    which $i > /dev/null && Log "$i found" || { Log ERROR "$i not found in PATH"; NOTFOUND="true"; }
  done

  if [[ "$NOTFOUND" == "true" ]]; then
    Log FATAL "Requirements unmet, aborting"
    exit $ERROR_UNMET_REQUIREMENTS
  else
    Log "All requirements met"
  fi
}

# Generate AWS configuration file from template
function generate_aws_config_from_template {
  SED_FAILED="false"
  Log "Processing \"aws.config.template\""
  sed \
    -e "s/PROJECT_REGION/$PROJECT_REGION/g" \
    ../templates/aws.config.template > ../aws.config || SED_FAILED="true"

  if [[ "$SED_FAILED" == "true" ]]; then
    Log FATAL "Could not generate \"aws.config\" from template, aborting"
    exit $ERROR_AWS_CONFIG_GENERATION
  else
    Log "\"aws.config\" generated successfully from template"
  fi
}

# Generate AWS credentials file from template
function generate_aws_credentials_from_template {
  if [[ -z ${AWS_ACCESS_KEY_ID+x} ]]; then
    Log FATAL "Environment variable AWS_ACCESS_KEY_ID is not set, aborting"
    exit $ERROR_AWS_ACCESS_KEY_ID_NOT_SET
  fi

  if [[ -z ${AWS_SECRET_ACCESS_KEY+x} ]]; then
    Log FATAL "Environment variable AWS_SECRET_ACCESS_KEY is not set, aborting"
    exit $ERROR_AWS_SECRET_ACCESS_KEY_NOT_SET
  fi

  SED_FAILED="false"
  Log "Processing \"aws.credentials.template\""
  sed \
    -e "s/AWS_ACCESS_KEY_ID/${AWS_ACCESS_KEY_ID//\//\\/}/g" \
    -e "s/AWS_SECRET_ACCESS_KEY/${AWS_SECRET_ACCESS_KEY//\//\\/}/g" \
    ../templates/aws.credentials.template > ../aws.credentials || SED_FAILED="true"

  if [[ "$SED_FAILED" == "true" ]]; then
    Log FATAL "Could not generate \"aws.credentials\" from template, aborting"
    exit $ERROR_AWS_CREDENTIALS_GENERATION
  else
    Log "\"aws.credentials\" generated successfully from template"
  fi
}

# Generate providers file from template
function generate_providers_tf_from_template {
  SED_FAILED="false"
  Log "Processing \"providers.tf.template\""
  sed \
    -e "s/TF_VERSION/$TF_VERSION/g" \
    -e "s/TF_AWS_VERSION/$TF_AWS_VERSION/g" \
    -e "s/PROJECT_OWNER/$PROJECT_OWNER/g" \
    -e "s/PROJECT_NAME/$PROJECT_NAME/g" \
    -e "s/LAB_NAME/$LAB_NAME/g" \
    ../templates/providers.tf.template > ../providers.tf || SED_FAILED="true"

  if [[ "$SED_FAILED" == "true" ]]; then
    Log FATAL "Could not generate \"providers.tf\" from template, aborting"
    exit $ERROR_PROVIDERS_TF_GENERATION
  else
    Log "\"providers.tf\" generated successfully from template"
  fi
}

# Generate ED25519 keypair for SSH
function generate_ssh_keypair {
  # Create files subdirectory
  # The command can be removed after we add there any static files tracked by Git
  mkdir -p ../files

  Log "Checking existence of keypair \"$KEYPAIR_FILENAME\""

  if [[ -f "../files/$KEYPAIR_FILENAME" ]]; then
    Log "Keypair already exists"
  else
    Log "Keypair non-existent, generating"
    ssh-keygen -t ed25519 -q -N '' -f "../files/${KEYPAIR_FILENAME}"

    if [[ $? -eq 0 ]]; then
      Log "Keypair generated successfully"
    else
      Log FATAL "Could not generate keypair, aborting"
      exit $ERROR_KEYPAIR_GENERATION
    fi
  fi
}

# Generate tfvars file from template
function generate_terraform_tfvars_from_template {
  Log "Looking up this host's IPv4 address"
  MY_IPV4=$(curl https://checkip.amazonaws.com/ 2> /dev/null)

  if [[ $? -eq 0 ]]; then
    Log "IPv4 address \"$MY_IPV4\" acquired successfully"
  else
    Log FATAL "Could not acquire IPv4 address, aborting"
    exit $ERROR_IPV4_LOOKUP
  fi

  SED_FAILED="false"
  Log "Processing \"terraform.tfvars.template\""
  sed \
    -e "s/PROJECT_OWNER/$PROJECT_OWNER/g" \
    -e "s/PROJECT_NAME/$PROJECT_NAME/g" \
    -e "s/KEYPAIR_FILENAME/$KEYPAIR_FILENAME/g" \
    -e "s/APPLICATION_PREFIX/$APPLICATION_PREFIX/g" \
    -e "s/MY_IPV4/$MY_IPV4/g" \
    ../templates/terraform.tfvars.template > ../terraform.tfvars || SED_FAILED="true"

  if [[ "$SED_FAILED" == "true" ]]; then
    Log FATAL "Could not generate \"terraform.tfvars\" from template, aborting"
    exit $ERROR_TERRAFORM_TFVARS_GENERATION
  else
    Log "\"terraform.tfvars\" generated successfully from template"
  fi
}

# Create workspaces
function create_terraform_workspaces {
  Log "Creating Terraform workspaces"

  for i in $WORKSPACES; do
    (cd ..; terraform workspace new $i &> /dev/null)
  done
}
# Section end: function definitions

# Section start: script main block
# Check if required binaries are present/in the PATH variable
check_requirements
# Generate AWS configuration file from template
generate_aws_config_from_template
# Generate AWS credentials file from template
generate_aws_credentials_from_template
# Generate providers file from template
generate_providers_tf_from_template
# Generate ED25519 keypair for SSH
generate_ssh_keypair
# Generate tfvars file from template
generate_terraform_tfvars_from_template
# Create workspaces
create_terraform_workspaces
# Section end: script main block
