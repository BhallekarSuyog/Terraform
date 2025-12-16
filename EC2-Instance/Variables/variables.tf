########################
# AMI Variables
########################
variable "ami_value" {
    description = "EC2 AMI Value"
    type = string
    default = "ami-02b8269d5e85954ef"
}

########################
# AMI Variables
########################
variable "instance_type" {
  description = "this is instance type"
  type = string
  default = "t3.micro"
}

########################
# Instance Name
########################
variable "instance_name" {
  description = "this is instance name"
  type = string
  default = "Ansible-server"
}

########################
# Provider Variables
########################
variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "ap-south-1"
}

########################
# VPC Variables
########################
variable "vpc_name" {
  description = "VPC name"
  type        = string
  default     = "Ansible-VPC"
}

variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
  default     = "10.0.0.0/16"
}

########################
# Subnet Variables
########################
variable "subnet_name" {
  description = "Subnet name"
  type        = string
  default     = "Ansible-Public-Subnet"
}

variable "subnet_cidr" {
  description = "CIDR block for subnet"
  type        = string
  default     = "10.0.1.0/24"
}

variable "availability_zone" {
  description = "Availability zone for subnet"
  type        = string
  default     = "ap-south-1a"
}

########################
# Internet Gateway
########################
variable "igw_name" {
  description = "Internet Gateway name"
  type        = string
  default     = "Ansible-IGW"
}

########################
# Route Table
########################
variable "route_table_name" {
  description = "Route table name"
  type        = string
  default     = "Ansible-Public-RT"
}

########################
# Key Pair
########################
variable "key_pair_name" {
  description = "EC2 Key pair name"
  type        = string
  default     = "Ansible-key"
}

variable "public_key_path" {
  description = "Path to SSH public key (.pub)"
  type        = string
  default     = "~/.ssh/id_ed25519.pub"
}

########################
# Security Group
########################
variable "security_group_name" {
  description = "Security group name"
  type        = string
  default     = "Ansible-SG"
}

variable "allowed_ssh_cidr" {
  description = "CIDR blocks allowed for SSH"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "allowed_http_cidr" {
  description = "CIDR blocks allowed for HTTP"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}
