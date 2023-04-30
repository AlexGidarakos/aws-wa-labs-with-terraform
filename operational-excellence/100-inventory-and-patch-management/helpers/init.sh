#!/usr/bin/env bash
cd $(dirname "$0")
source init.inc.sh

# Section start: function definitions
function generate_aws_config_from_template {
  SED_FAILED="false"
  echo "Processing \"aws.config.template\""
  sed \
    -e "s/PROJECT_REGION/$PROJECT_REGION/g" \
    ../templates/aws.config.template > ../aws.config || SED_FAILED="true"

  if [[ "$SED_FAILED" == "true" ]]; then
    echo "Error generating \"aws.config\" from template, aborting"
    exit $ERROR_AWS_CONFIG_GENERATION
  else
    echo "\"aws.config\" created successfully from template"
  fi
}
# Section end: function definitions

# Section start: script main block
# Generate AWS configuration file from template
generate_aws_config_from_template
# Section end: script main block
