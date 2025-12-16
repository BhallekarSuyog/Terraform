########################
# AMI Variables
########################
variable "ami_value" {
    description = "EC2 AMI Value"
    type = string
}

########################
# AMI Variables
########################
variable "instance_type" {
  description = "this is instance type"
  type = string
}

########################
# Instance Name
########################
variable "instance_name" {
  description = "this is instance name"
  type = string
}

########################
# Provider Variables
########################
variable "aws_region" {
  description = "AWS region"
  type        = string
}

########################
# VPC Variables
########################
variable "vpc_name" {
  description = "VPC name"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
}

########################
# Subnet Variables
########################
variable "subnet_name" {
  description = "Subnet name"
  type        = string
}

variable "subnet_cidr" {
  description = "CIDR block for subnet"
  type        = string
}

variable "availability_zone" {
  description = "Availability zone for subnet"
  type        = string
}

########################
# Internet Gateway
########################
variable "igw_name" {
  description = "Internet Gateway name"
  type        = string
}

########################
# Route Table
########################
variable "route_table_name" {
  description = "Route table name"
  type        = string
}

########################
# Key Pair
########################
variable "key_pair_name" {
  description = "EC2 Key pair name"
  type        = string
}

variable "public_key_path" {
  description = "Path to SSH public key (.pub)"
  type        = string
}

########################
# Security Group
########################
variable "security_group_name" {
  description = "Security group name"
  type        = string
}

variable "allowed_ssh_cidr" {
  description = "CIDR blocks allowed for SSH"
  type        = list(string)
}

variable "allowed_http_cidr" {
  description = "CIDR blocks allowed for HTTP"
  type        = list(string)
}
