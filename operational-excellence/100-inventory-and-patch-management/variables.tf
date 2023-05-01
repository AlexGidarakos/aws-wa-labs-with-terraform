# Input variable definitions
# Section start: variables for keypairs.tf
variable "resource_prefix" {
  type = string
}

variable "key_pair_main_public_key" {
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
# Section end: variables for networks.tf

# Section start: variables for security.tf
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
  type = bool
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
  type = bool
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
  type = bool
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

variable "network_acl_rule_out_http_rule_number" {
  type = number
}

variable "network_acl_rule_out_http_protocol" {
  type = string
}

variable "network_acl_rule_out_http_rule_action" {
  type = string
}

variable "network_acl_rule_out_http_egress" {
  type = bool
}

variable "network_acl_rule_out_http_cidr_block" {
  type = string
}

variable "network_acl_rule_out_http_from_port" {
  type = number
}

variable "network_acl_rule_out_http_to_port" {
  type = number
}

variable "network_acl_rule_out_https_rule_number" {
  type = number
}

variable "network_acl_rule_out_https_protocol" {
  type = string
}

variable "network_acl_rule_out_https_rule_action" {
  type = string
}

variable "network_acl_rule_out_https_egress" {
  type = bool
}

variable "network_acl_rule_out_https_cidr_block" {
  type = string
}

variable "network_acl_rule_out_https_from_port" {
  type = number
}

variable "network_acl_rule_out_https_to_port" {
  type = number
}

variable "network_acl_rule_out_responses_rule_number" {
  type = number
}

variable "network_acl_rule_out_responses_protocol" {
  type = string
}

variable "network_acl_rule_out_responses_rule_action" {
  type = string
}

variable "network_acl_rule_out_responses_egress" {
  type = bool
}

variable "network_acl_rule_out_responses_cidr_block" {
  type = string
}

variable "network_acl_rule_out_responses_from_port" {
  type = number
}

variable "network_acl_rule_out_responses_to_port" {
  type = number
}

variable "security_group_main_ingress1_protocol" {
  type = string
}

variable "security_group_main_ingress1_from_port" {
  type = number
}

variable "security_group_main_ingress1_to_port" {
  type = number
}

variable "my_ipv4" {
  type = string
}

variable "security_group_main_ingress2_protocol" {
  type = string
}

variable "security_group_main_ingress2_from_port" {
  type = number
}

variable "security_group_main_ingress2_to_port" {
  type = number
}
# Section end: variables for security.tf

# Section start: variables for ec2.tf
variable "ami_main_owners" {
  type = list(string)
}

variable "ami_main_filter_values" {
  type = list(string)
}
# Section end: variables for ec2.tf
