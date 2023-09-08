output "vpc_id" {
  description = "ID of the VPC"
  value       = aws_vpc.main.id
}

output "private_subnet_ids" {
  description = "IDs of created subnets"
  value       = aws_subnet.private[*].id
}

output "public_subnet_ids" {
  description = "IDs of created subnets"
  value       = aws_subnet.public[*].id
}

output "igw_id" {
  description = "ID of created internet gateway"
  value       = aws_internet_gateway.main.id
}

output "public_route_table_ids" {
  description = "ID of public route tables"
  value       = aws_route_table.public.id
}

output "private_route_table_id" {
  description = "ID of private route table"
  value       = aws_route_table.private[*].id
}
