# Section start: base variables
# Some of these values affect resource names, tags, etc. generated from template files
TF_VERSION="1.4.6"
TF_AWS_VERSION="4.65.0"
PROJECT_OWNER="alexg"  # E.g. a person, team etc.
PROJECT_NAME="aws-wa-labs-tf"
LAB_NAME="operational-excellence\/100-inventory-and-patch-management"
PROJECT_REGION="us-east-1"
WORKSPACES="prod test"
# Section end: base variables

# Section start: derived variables
# Variables derived from the base variables
KEYPAIR_FILENAME="${PROJECT_OWNER}-${PROJECT_NAME}-ed25519-key"
APPLICATION_PREFIX="${PROJECT_OWNER}\/${PROJECT_NAME}\/${LAB_NAME}"
# Section end: derived variables

# Section start: exit codes
EXIT_OK=0
ERROR_AWS_CONFIG_GENERATION=1
ERROR_AWS_ACCESS_KEY_ID_NOT_SET=2
ERROR_AWS_SECRET_ACCESS_KEY_NOT_SET=3
ERROR_AWS_CREDENTIALS_GENERATION=4
ERROR_PROVIDERS_TF_GENERATION=5
ERROR_KEYPAIR_GENERATION=6
ERROR_TERRAFORM_TFVARS_GENERATION=7
# Section end: exit codes
