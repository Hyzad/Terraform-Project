output "load_balancer_arn" {
  description = "ARN of the load balancer"
  value       = aws_lb.main.arn
}

output "load_balancer_id" {
  description = "ID of the load balancer"
  value       = aws_lb.main.id
}

output "listener_arn" {
  description = "ARN of the listener"
  value       = aws_lb_listener.main.arn
}

output "listener_id" {
  description = "ID of the listener"
  value       = aws_lb_listener.main.id
}

output "target_group_arn" {
  description = "ARN of the target group"
  value       = aws_lb_target_group.main.arn
}

output "target_group_id" {
  description = "ID of the target group"
  value       = aws_lb_target_group.main.id
}
