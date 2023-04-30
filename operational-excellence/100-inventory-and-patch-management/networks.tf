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
