# Define the main VPC
resource "aws_vpc" "main" {
  cidr_block = var.vpc_main_cidr_block

  tags = {
    Application = "${var.Application_prefix}/${terraform.workspace}"
    Name        = "${terraform.workspace}"
  }
}

# Define the main subnet
resource "aws_subnet" "main" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.subnet_main_cidr_block

  tags = {
    Application = "${var.Application_prefix}/${terraform.workspace}"
    Name        = "${terraform.workspace}"
  }
}

# Define the main internet gateway
resource "aws_internet_gateway" "main" {
  tags = {
    Application = "${var.Application_prefix}/${terraform.workspace}"
    Name        = "${terraform.workspace}"
  }
}

# Define attachment of IGW to VPC
resource "aws_internet_gateway_attachment" "main" {
  internet_gateway_id = aws_internet_gateway.main.id
  vpc_id              = aws_vpc.main.id
}

# Define the main route table
resource "aws_route_table" "main" {
  vpc_id = aws_vpc.main.id

  tags = {
    Application = "${var.Application_prefix}/${terraform.workspace}"
    Name        = "${terraform.workspace}"
  }
}

# Define route
resource "aws_route" "main" {
  route_table_id         = aws_route_table.main.id
  destination_cidr_block = var.aws_route_main_destination_cidr_block
  gateway_id             = aws_internet_gateway.main.id
}

# Define attachment of RTB to subnet
resource "aws_route_table_association" "main" {
  route_table_id = aws_route_table.main.id
  subnet_id      = aws_subnet.main.id
}

# Define the main network ACL
resource "aws_network_acl" "main" {
  vpc_id = aws_vpc.main.id

  tags = {
    Application = "${var.Application_prefix}/${terraform.workspace}"
    Name        = "${terraform.workspace}"
  }
}

# Define NACL rule for inbound HTTP
resource "aws_network_acl_rule" "in_http" {
  network_acl_id = aws_network_acl.main.id
  rule_number    = var.network_acl_rule_in_http_rule_number
  protocol       = var.network_acl_rule_in_http_protocol
  rule_action    = var.network_acl_rule_in_http_rule_action
  egress         = var.network_acl_rule_in_http_egress
  cidr_block     = var.network_acl_rule_in_http_cidr_block
  from_port      = var.network_acl_rule_in_http_from_port
  to_port        = var.network_acl_rule_in_http_to_port
}

# Define NACL rule for inbound SSH
resource "aws_network_acl_rule" "in_ssh" {
  network_acl_id = aws_network_acl.main.id
  rule_number    = var.network_acl_rule_in_ssh_rule_number
  protocol       = var.network_acl_rule_in_ssh_protocol
  rule_action    = var.network_acl_rule_in_ssh_rule_action
  egress         = var.network_acl_rule_in_ssh_egress
  cidr_block     = var.network_acl_rule_in_ssh_cidr_block
  from_port      = var.network_acl_rule_in_ssh_from_port
  to_port        = var.network_acl_rule_in_ssh_to_port
}

# Define NACL rule for inbound response ports
resource "aws_network_acl_rule" "in_responses" {
  network_acl_id = aws_network_acl.main.id
  rule_number    = var.network_acl_rule_in_responses_rule_number
  protocol       = var.network_acl_rule_in_responses_protocol
  rule_action    = var.network_acl_rule_in_responses_rule_action
  egress         = var.network_acl_rule_in_responses_egress
  cidr_block     = var.network_acl_rule_in_responses_cidr_block
  from_port      = var.network_acl_rule_in_responses_from_port
  to_port        = var.network_acl_rule_in_responses_to_port
}
