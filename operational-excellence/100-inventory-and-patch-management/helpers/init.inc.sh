# Section start: base variables
# These values affect resource names, tags, etc. generated from the template files
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
# Section end: exit codes
