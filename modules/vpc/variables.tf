variable "vpc_name" {
  description = "Name that will be used to generate name tag for resources created by module"
  type        = string
}

variable "managed_by" {
  description = "Value for managed by tag given to resources in the module, default is Terraform"
  type        = string
  default     = "Terraform"
}

variable "vpc_cidr_block" {
  description = "CIDR block for the VPC, default is 10.0.0.0/16"
  type        = string
  default     = "10.0.0.0/16"
}

variable "subnet_azs" {
  description = "List of availability zones to create subnets in"
  type        = list(string)
}

variable "private_subnet_cidr" {
  description = "CIDR ranges to use for private subnets"
  type        = list(string)
  default     = ["10.0.0.0/20", "10.0.16.0/20", "10.0.32.0/20"]
}

variable "public_subnet_cidr" {
  description = "CIDR ranges to use for private subnets"
  type        = list(string)
  default     = ["10.0.128.0/20", "10.0.144.0/20", "10.0.160.0/20"]
}
