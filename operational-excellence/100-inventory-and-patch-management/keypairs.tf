resource "aws_key_pair" "kp" {
  key_name   = "${var.key_name_prefix}-${terraform.workspace}-kp"
  public_key = file("./files/${var.public_key}")

  tags = {
    Application = "${var.Application_prefix}/${terraform.workspace}"
    Name        = "${terraform.workspace}"
  }
}
