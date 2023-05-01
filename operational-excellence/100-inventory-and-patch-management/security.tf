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

# Define NACL rule for outbound HTTP
resource "aws_network_acl_rule" "out_http" {
  network_acl_id = aws_network_acl.main.id
  rule_number    = var.network_acl_rule_out_http_rule_number
  protocol       = var.network_acl_rule_out_http_protocol
  rule_action    = var.network_acl_rule_out_http_rule_action
  egress         = var.network_acl_rule_out_http_egress
  cidr_block     = var.network_acl_rule_out_http_cidr_block
  from_port      = var.network_acl_rule_out_http_from_port
  to_port        = var.network_acl_rule_out_http_to_port
}

# Define NACL rule for outbound HTTPS
resource "aws_network_acl_rule" "out_https" {
  network_acl_id = aws_network_acl.main.id
  rule_number    = var.network_acl_rule_out_https_rule_number
  protocol       = var.network_acl_rule_out_https_protocol
  rule_action    = var.network_acl_rule_out_https_rule_action
  egress         = var.network_acl_rule_out_https_egress
  cidr_block     = var.network_acl_rule_out_https_cidr_block
  from_port      = var.network_acl_rule_out_https_from_port
  to_port        = var.network_acl_rule_out_https_to_port
}

# Define NACL rule for outbound response ports
resource "aws_network_acl_rule" "out_responses" {
  network_acl_id = aws_network_acl.main.id
  rule_number    = var.network_acl_rule_out_responses_rule_number
  protocol       = var.network_acl_rule_out_responses_protocol
  rule_action    = var.network_acl_rule_out_responses_rule_action
  egress         = var.network_acl_rule_out_responses_egress
  cidr_block     = var.network_acl_rule_out_responses_cidr_block
  from_port      = var.network_acl_rule_out_responses_from_port
  to_port        = var.network_acl_rule_out_responses_to_port
}

# Define attachment of NACL to subnet
resource "aws_network_acl_association" "main" {
  network_acl_id = aws_network_acl.main.id
  subnet_id      = aws_subnet.main.id
}
