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

# Generate AWS configuration file from template
function generate_aws_config_from_template {
  SED_FAILED="false"
  Log "Processing \"aws.config.template\""
  sed \
    -e "s/PROJECT_REGION/$PROJECT_REGION/g" \
    ../templates/aws.config.template > ../aws.config || SED_FAILED="true"

  if [[ "$SED_FAILED" == "true" ]]; then
    Log FATAL "Error generating \"aws.config\" from template, aborting"
    exit $ERROR_AWS_CONFIG_GENERATION
  else
    Log "\"aws.config\" created successfully from template"
  fi
}
# Section end: function definitions

# Section start: script main block
# Generate AWS configuration file from template
generate_aws_config_from_template
# Section end: script main block
