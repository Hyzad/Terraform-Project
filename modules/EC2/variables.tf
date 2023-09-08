variable "ami" {
  description = "AMI to use for the instances"
  type        = string
}

variable "instance_type" {
  description = "Instance type to use for the instances"
  type        = string
}

variable "associate_public_ip" {
  description = "Whether to associate a public IP with the instances"
  type        = bool
}

variable "subnet_ids" {
  description = "List of subnet IDs to create instances in"
  type        = list(string)
}

variable "security_group_ids" {
  description = "List of security group IDs to add to the instances"
  type        = list(string)
}

variable "key_name" {
  description = "Key name of the key pair to use for the instances"
  type        = string
}

variable "instance_name" {
  description = "Name to use for the instances"
  type        = string
}

variable "managed_by" {
  description = "Group that manages the security group, default is Terraform"
  type        = string
  default     = "Terraform"
}
