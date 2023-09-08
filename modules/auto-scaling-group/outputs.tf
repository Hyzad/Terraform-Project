output "id" {
  description = "ID of the auto scaling group"
  value       = aws_autoscaling_group.main.id
}

output "arn" {
  description = "ARN of the auto scaling group"
  value       = aws_autoscaling_group.main.arn
}

output "availability_zones" {
  description = "Availability zones of the auto scaling group"
  value       = aws_autoscaling_group.main.availability_zones
}

output "name" {
  description = "Name of the auto scaling group"
  value       = aws_autoscaling_group.main.name
}

output "lt_arn" {
  description = "ARN of the launch template"
  value       = aws_launch_template.main[0].arn
}

output "lt_id" {
  description = "ID of the launch template"
  value       = aws_launch_template.main[0].id
}

output "lt_latest_version" {
  description = "Latest version of the launch template"
  value       = aws_launch_template.main[0].latest_version
}
