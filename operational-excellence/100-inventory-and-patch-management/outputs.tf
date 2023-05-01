# Define primary URL output
output "primary_url" {
  value = "http://${aws_instance.web[0].public_ip}"
}

# Define secondary URL output
output "secondary_url" {
  value = "http://${aws_instance.web[1].public_ip}"
}
