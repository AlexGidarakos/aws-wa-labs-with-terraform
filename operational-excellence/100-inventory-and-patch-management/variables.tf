# Input variable definitions
# Section start: variables for keypairs.tf
variable "key_name_prefix" {
  type = string
}

variable "public_key" {
  type = string
}

variable "Application_prefix" {
  type = string
}
# Section end: variables for keypairs.tf

# Section start: variables for networks.tf
variable "vpc_main_cidr_block" {
  type = string
}

variable "subnet_main_cidr_block" {
  type = string
}
# Section end: variables for networks.tf
