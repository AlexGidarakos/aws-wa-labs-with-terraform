# Define association with SSM document for Inventory
resource "aws_ssm_association" "main" {
  name                = var.ssm_association_main_name
  association_name    = var.ssm_association_main_association_name
  schedule_expression = var.ssm_association_main_schedule_expression

  targets {
    key    = var.ssm_association_main_targets_key
    values = var.ssm_association_main_targets_values
  }
}
