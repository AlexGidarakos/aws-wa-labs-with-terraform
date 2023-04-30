# This terraform block is only used to configure providers
# A backend may be configured by a "terraform" block in backend.tf
terraform {
  required_version = ">= 1.4.6"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.65.0"
    }
  }
}
