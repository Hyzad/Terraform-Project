variable "asg_name" {
  description = "Name of the auto scaling group"
  type        = string
}

variable "max_size" {
  description = "Max size of the auto scaling group"
  type        = number
}

variable "min_size" {
  description = "Minimum size of the auto scaling group"
  type        = number
}

variable "desired_size" {
  description = "Desired size of the auto scaling group"
  type        = number
}

variable "subnet_ids" {
  description = "List of subnet IDs for the auto scaling group to provision instances in"
  type        = list(string)
}

variable "target_group_arns" {
  description = "List of target group arns to attach the instances to"
  type        = list(string)
}

variable "health_check_type" {
  description = "Type of health check, EC2 or ELB"
  type        = string
}

variable "health_check_grace_period" {
  description = "Time in seconds after instnce comes into service before checking health, required if health check type is ELB, default is 300 (seconds)"
  type        = number
  default     = 300
}

variable "launch_template_name" {
  description = "Name to use for new launch template"
  type        = string
}

variable "launch_template_version" {
  description = "Version of the launch template to use, can be version number, $Latest, or $Default, default is $Default"
  type        = string
  default     = "$Default"
}

variable "launch_template_ami" {
  description = "AMI to use in the launch template"
  type        = string
}
variable "launch_template_description" {
  description = "Description of the launch template"
  type        = string
}

variable "key_name" {
  description = "Name of key pair to use for the instances"
  type        = string
}

variable "instance_type" {
  description = "Type of instance to use in the launch template, default is t2.micro"
  type        = string
  default     = "t2.micro"
}

variable "security_group_ids" {
  description = "List of IDs of security groups to add to the instances"
  type        = list(string)
}

variable "launch_template_user_data" {
  description = "Path to user data file to use in the launch template, default is null"
  type        = string
  default     = null
}

variable "managed_by" {
  description = "Group that manages the security group, default is Terraform"
  type        = string
  default     = "Terraform"
}

variable "launch_template_id" {
  description = "ID of existing launch template for auto scaling group, overwrites launch_template_name, default is"
  type        = string
  default     = null
}
