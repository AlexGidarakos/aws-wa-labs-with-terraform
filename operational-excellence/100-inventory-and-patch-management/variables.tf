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

variable "security_group_main_ingress1_cidr_blocks" {
  type = list(string)
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

variable "security_group_main_ingress2_cidr_blocks" {
  type = list(string)
}

variable "security_group_main_egress_protocol" {
  type = string
}

variable "security_group_main_egress_from_port" {
  type = number
}

variable "security_group_main_egress_to_port" {
  type = number
}

variable "security_group_main_egress_cidr_blocks" {
  type = list(string)
}
# Section end: variables for security.tf

# Section start: variables for ec2.tf
variable "ami_main_owners" {
  type = list(string)
}

variable "ami_main_filter_values" {
  type = list(string)
}

variable "instance_web_count" {
  type = number
}

variable "instance_web_instance_type" {
  type = string
}

variable "instance_associate_public_ip_address" {
  type = bool
}

variable "instance_network_interface_device_index" {
  type = number
}

variable "instance_network_interface_delete_on_termination" {
  type = bool
}

variable "instance_tags_SSMManaged" {
  type = string
}

variable "instance_tags_Confidentiality" {
  type = string
}

variable "instance_tags_Environment" {
  type = string
}

variable "instance_tags_InstanceRole" {
  type = string
}

variable "instance_tags_PatchGroup" {
  type = string
}

variable "instance_app_count" {
  type = number
}

variable "instance_app_instance_type" {
  type = string
}
# Section end: variables for ec2.tf
