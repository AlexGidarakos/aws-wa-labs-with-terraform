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

variable "aws_route_main_destination_cidr_block" {
  type = string
}

variable "network_acl_rule_in_http_rule_number" {
  type = number
}

variable "network_acl_rule_in_http_protocol" {
  type = string
}

variable "network_acl_rule_in_http_rule_action" {
  type = string
}

variable "network_acl_rule_in_http_egress" {
  type = string
}

variable "network_acl_rule_in_http_cidr_block" {
  type = string
}

variable "network_acl_rule_in_http_from_port" {
  type = number
}

variable "network_acl_rule_in_http_to_port" {
  type = number
}

variable "network_acl_rule_in_ssh_rule_number" {
  type = number
}

variable "network_acl_rule_in_ssh_protocol" {
  type = string
}

variable "network_acl_rule_in_ssh_rule_action" {
  type = string
}

variable "network_acl_rule_in_ssh_egress" {
  type = string
}

variable "network_acl_rule_in_ssh_cidr_block" {
  type = string
}

variable "network_acl_rule_in_ssh_from_port" {
  type = number
}

variable "network_acl_rule_in_ssh_to_port" {
  type = number
}

variable "network_acl_rule_in_responses_rule_number" {
  type = number
}

variable "network_acl_rule_in_responses_protocol" {
  type = string
}

variable "network_acl_rule_in_responses_rule_action" {
  type = string
}

variable "network_acl_rule_in_responses_egress" {
  type = string
}

variable "network_acl_rule_in_responses_cidr_block" {
  type = string
}

variable "network_acl_rule_in_responses_from_port" {
  type = number
}

variable "network_acl_rule_in_responses_to_port" {
  type = number
}
# Section end: variables for networks.tf
