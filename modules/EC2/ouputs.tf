output "instance_ids" {
  description = "List of instance IDs"
  value       = aws_instance.main[*].id
}

output "instance_arns" {
  description = "List of instance ARNs"
  value       = aws_instance.main[*].arn
}

output "public_ips" {
  description = "List of public IP addresses assigned to instances"
  value       = aws_instance.main[*].public_ip
}

output "instance_state" {
  description = "List of the state of the instances"
  value       = aws_instance.main[*].instance_state
}
