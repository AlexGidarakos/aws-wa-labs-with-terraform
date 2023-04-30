# Section start: base variables
# Some of these values affect resource names, tags, etc. generated from template files
TF_VERSION="1.4.6"
TF_AWS_VERSION="4.65.0"
PROJECT_OWNER="alexg"  # E.g. a person, team etc.
PROJECT_NAME="aws-wa-labs-tf"
LAB_NAME="operational-excellence/100-inventory-and-patch-management"
PROJECT_REGION="us-east-1"
# Section end: base variables

# Section start: exit codes
EXIT_OK=0
ERROR_AWS_CONFIG_GENERATION=1
ERROR_AWS_ACCESS_KEY_ID_NOT_SET=2
ERROR_AWS_SECRET_ACCESS_KEY_NOT_SET=3
ERROR_AWS_CREDENTIALS_GENERATION=4
ERROR_PROVIDERS_TF_GENERATION=5
# Section end: exit codes
