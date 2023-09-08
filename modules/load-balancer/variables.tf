variable "lb_name" {
  description = "Name for the load balancer"
  type        = string
}

variable "internal" {
  description = "Bool whether load balancer is internal, default is false"
  type        = bool
  default     = false
}

variable "lb_type" {
  description = "The type of the load balancer"
  type        = string
}

variable "security_group_ids" {
  description = "List of IDs of the security groups for the load balancer"
  type        = list(string)
}

variable "subnet_ids" {
  description = "List of subnet ids to attach to the load balancer"
  type        = list(string)
}

variable "ip_type" {
  description = "Type of IP addresses used by the subnets for the load balancer, default is ipv4"
  type        = string
  default     = "ipv4"
}

variable "managed_by" {
  description = "Group that manages the security group, default is Terraform"
  type        = string
  default     = "Terraform"
}

variable "lb_port" {
  description = "Port on which the targets recieve traffic"
  type        = number
}

variable "lb_protocol" {
  description = "Protocol to use for routing traffic to the targets"
  type        = string
}

variable "vpc_id" {
  description = "ID of the vpc to create the target group in"
  type        = string
}

variable "instance_ids" {
  description = "List of instance IDs to add to taget group"
  type        = list(string)
}

variable "listener_action_type" {
  description = "Type of the default routing action of the listener"
  type        = string
}
