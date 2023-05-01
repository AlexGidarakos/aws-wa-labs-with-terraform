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

  depends_on = [
    aws_internet_gateway_attachment.main
  ]
}

# Define attachment of RTB to subnet
resource "aws_route_table_association" "main" {
  route_table_id = aws_route_table.main.id
  subnet_id      = aws_subnet.main.id
}
