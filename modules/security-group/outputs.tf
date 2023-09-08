output "sg_id" {
  description = "ID of the created security group"
  value       = aws_security_group.main.id
}

output "sg_arn" {
  description = "ID of the created security group"
  value       = aws_security_group.main.arn
}

output "sg_outbound_rule_id" {
  description = "ID of the outbound rule added to the security group"
  value       = aws_vpc_security_group_egress_rule.outbound_traffic[*].id
}

output "sg_outbound_rule_arn" {
  description = "ARN of the outbound rule added to the security group"
  value       = aws_vpc_security_group_egress_rule.outbound_traffic[*].arn
}

output "sg_http_id" {
  description = "ID of the inbound rule for http added to the security group"
  value       = aws_vpc_security_group_ingress_rule.http[*].id
}

output "sg_http_arn" {
  description = "ARN of the inbound rule for http added to the security group"
  value       = aws_vpc_security_group_ingress_rule.http[*].arn
}

output "sg_https_id" {
  description = "ID of the inbound rule for https added to the security group"
  value       = aws_vpc_security_group_ingress_rule.https[*].id
}

output "sg_https_arn" {
  description = "ARN of the inbound rule for https added to the security group"
  value       = aws_vpc_security_group_ingress_rule.https[*].arn
}

output "sg_ssh_id" {
  description = "ID of the inbound rule for ssh added to the security group"
  value       = aws_vpc_security_group_ingress_rule.ssh[*].id
}

output "sg_ssh_arn" {
  description = "ARN of the inbound rule for ssh added to the security group"
  value       = aws_vpc_security_group_ingress_rule.ssh[*].arn
}
