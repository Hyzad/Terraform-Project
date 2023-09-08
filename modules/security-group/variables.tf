variable "sg_name" {
  description = "Name of the security group"
  type        = string
}

variable "description" {
  description = "Description of the security group"
  type        = string
}

variable "vpc_id" {
  description = "ID of the vpc to make the security group for"
  type        = string
}

variable "managed_by" {
  description = "Group that manages the security group, default is Terraform"
  type        = string
  default     = "Terraform"
}

variable "allow_outbound" {
  description = "Bool whether to add an egress rule allowing all outbound traffic"
  type        = bool
}

variable "allow_http" {
  description = "Bool whether to create rule for allowing http and https on ports 80 and 443, default is false"
  type        = bool
}

variable "http_port" {
  description = "Port to allow http requests on, default is 80"
  type        = number
  default     = 80
}

variable "https_port" {
  description = "Port to allow https requests on, default is 80"
  type        = number
  default     = 443
}

variable "http_cidr" {
  description = "CIDR range to allow http/https requests from"
  type        = string
  default     = "0.0.0.0/0"
}

variable "allow_ssh" {
  description = "Bool whether to create a rule to allow inbound ssh"
  type        = bool
}

variable "ssh_port" {
  description = "Port to allow ssh requests on, default is 22"
  type        = number
  default     = 22
}

variable "ssh_cidr" {
  description = "CIDR range to allow ssh connections from"
  type        = string
  default     = "Null"
}

variable "outbound_cidr" {
  description = "CIDR range to allow outbound connections form"
  type        = string
  default     = "0.0.0.0/0"
}
