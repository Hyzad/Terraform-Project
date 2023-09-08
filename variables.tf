variable "vpc_name" {
  description = "Name that will be used to generate name tag for resources created by module"
  type        = string
}

variable "managed_by" {
  description = "Value for managed by tag given to resources in the module, default is Terraform"
  type        = string
  default     = "Terraform"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC, default is 10.0.0.0/16"
  type        = string
}


variable "private_cidr" {
  description = "CIDR ranges to use for private subnets"
  type        = list(string)
}

variable "public_cidr" {
  description = "CIDR ranges to use for private subnets"
  type        = list(string)
}

variable "subnet_availability_zones" {
  description = "List of availability zones to create subnets in"
  type        = list(string)
}

variable "sg_name" {
  description = "Name of the security group"
  type        = string
}

variable "sg_description" {
  description = "Description of the security group"
  type        = string
}

variable "allow_outbound_traffic" {
  description = "Bool whether to add a rule to the security group allowing all outbound traffic"
  type        = bool
}

variable "create_http_rule" {
  description = "Bool whether to add a rule to allow http and https connections on port 80 from all IPs"
  type        = bool
}

variable "create_ssh_rule" {
  description = "Bool whether to create a rule allowing ssh connections from the specified CIDR range"
  type        = bool
}

variable "http_cidr" {
  description = "CIDR range to allow http and https connections from"
  type        = string
}

variable "outbound_cidr" {
  description = "CIDR range to allow outbound connections to"
  type        = string
}

variable "instance_name" {
  description = "Name to use for the instances"
  type        = string
}

variable "instance_type" {
  description = "Type of instance to create"
  type        = string
}

variable "associate_public_ip" {
  description = "Bool whether to give the instances a public ip"
  type        = bool
}

variable "key_name" {
  description = "Name of the key pair to use for the instances"
  type        = string
}

variable "ami_id" {
  description = "ID of ami that will be ran on each instance"
  type        = string
}

variable "lb_name" {
  description = "Name of the load balancer"
  type        = string
}
variable "lb_internal" {
  description = "Whether the load balancer is internal or not, default is false"
  type        = bool
  default     = false
}

variable "lb_type" {
  description = "Type of the load balancer"
  type        = string
}

variable "lb_ip_type" {
  description = "Type of IP addresses used by the subnets for the load balancer"
  type        = string
}

variable "lb_port" {
  description = "Port on which targets recieve traffic"
  type        = number
}

variable "lb_protocol" {
  description = "Protocol to use for routing traffic to targets"
  type        = string
}

variable "listener_action_type" {
  description = "Type of the default routing action of the listener"
  type        = string
}

variable "asg_name" {
  description = "Name of the autoscaling group"
  type        = string
}

variable "asg_max_size" {
  description = "Maximum size of the autoscaling group"
  type        = number
}

variable "asg_min_size" {
  description = "Minimum size of the autoscaling group"
  type        = number
}

variable "asg_desired_size" {
  description = "Desired size of the autoscaling group"
  type        = number
}

variable "asg_health_check_type" {
  description = "Type of health check for the autoscaling group, EC2 or ELB"
  type        = string
}

variable "lt_name" {
  description = "Name of the launch template"
  type        = string
}

variable "lt_description" {
  description = "Description of the launch template"
  type        = string
}

variable "lt_version" {
  description = "Version of the launch template to use"
  type        = string
}