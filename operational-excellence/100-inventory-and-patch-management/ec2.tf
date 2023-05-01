# Define AMI via filtered lookup
data "aws_ami" "main" {
  most_recent = true
  owners      = var.ami_main_owners

  filter {
    name   = "name"
    values = var.ami_main_filter_values
  }
}

# Define web server instances
resource "aws_instance" "web" {
  count                       = var.instance_web_count
  ami                         = data.aws_ami.main.id
  instance_type               = var.instance_web_instance_type
  key_name                    = aws_key_pair.main.key_name
  associate_public_ip_address = var.instance_associate_public_ip_address
  vpc_security_group_ids      = [aws_security_group.main.id]
  subnet_id                   = aws_subnet.main.id
  user_data                   = file("./files/aws_instance.web.user_data")

  tags = {
    Application     = "${var.Application_prefix}/${terraform.workspace}"
    Name            = "${terraform.workspace}-web${count.index}"
    SSMManaged      = var.instance_tags_SSMManaged
    Confidentiality = var.instance_tags_Confidentiality
    Environment     = var.instance_tags_Environment
    InstanceRole    = var.instance_tags_InstanceRole
    PatchGroup      = var.instance_tags_PatchGroup
    Workload        = "${terraform.workspace}"
  }

  depends_on = [
    aws_internet_gateway_attachment.main
  ]
}

# Define app server instances
resource "aws_instance" "app" {
  count                       = var.instance_app_count
  ami                         = data.aws_ami.main.id
  instance_type               = var.instance_app_instance_type
  key_name                    = aws_key_pair.main.key_name
  associate_public_ip_address = var.instance_associate_public_ip_address
  vpc_security_group_ids      = [aws_security_group.main.id]
  subnet_id                   = aws_subnet.main.id

  tags = {
    Application     = "${var.Application_prefix}/${terraform.workspace}"
    Name            = "${terraform.workspace}-app${count.index}"
    SSMManaged      = var.instance_tags_SSMManaged
    Confidentiality = var.instance_tags_Confidentiality
    Environment     = var.instance_tags_Environment
    InstanceRole    = var.instance_tags_InstanceRole
    PatchGroup      = var.instance_tags_PatchGroup
    Workload        = "${terraform.workspace}"
  }

  depends_on = [
    aws_internet_gateway_attachment.main
  ]
}
