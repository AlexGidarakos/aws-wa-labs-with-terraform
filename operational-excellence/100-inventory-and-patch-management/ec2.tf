data "aws_ami" "main" {
  most_recent = true
  owners      = var.ami_main_owners

  filter {
    name   = "name"
    values = var.ami_main_filter_values
  }
}
