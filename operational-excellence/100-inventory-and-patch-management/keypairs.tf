resource "aws_key_pair" "main" {
  key_name   = "${var.resource_prefix}-${terraform.workspace}-kp"
  public_key = file("./files/${var.key_pair_main_public_key}")

  tags = {
    Application = "${var.Application_prefix}/${terraform.workspace}"
    Name        = "${terraform.workspace}"
  }
}
