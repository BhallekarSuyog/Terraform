#########################
# AMI and Instance type
#########################
ami_value = "ami-02b8269d5e85954ef"
instance_type = "t3.micro"
instance_name = "Ansible-server"

########################
# Provider
########################
aws_region = "ap-south-1"

########################
# VPC
########################
vpc_name = "Ansible-VPC"
vpc_cidr = "10.0.0.0/16"

########################
# Subnet
########################
subnet_name        = "Ansible-Public-Subnet"
subnet_cidr        = "10.0.1.0/24"
availability_zone  = "ap-south-1a"

########################
# Internet Gateway
########################
igw_name = "Ansible-IGW"

########################
# Route Table
########################
route_table_name = "Ansible-Public-RT"

########################
# Key Pair
########################
key_pair_name     = "Ansible-key"
public_key_path   = "~/.ssh/id_ed25519.pub"

########################
# Security Group
########################
security_group_name = "Ansible-SG"

allowed_ssh_cidr = [
  "0.0.0.0/0"
]

allowed_http_cidr = [
  "0.0.0.0/0"
]
