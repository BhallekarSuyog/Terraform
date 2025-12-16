################################
# VPC
################################
resource "aws_vpc" "myvpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = var.vpc_name
  }
}

################################
# Internet Gateway
################################
resource "aws_internet_gateway" "myigw" {
  vpc_id = aws_vpc.myvpc.id

  tags = {
    Name = var.igw_name
  }
}

################################
# Subnet (Public)
################################
resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.myvpc.id
  cidr_block              = var.subnet_cidr
  availability_zone       = var.availability_zone
  map_public_ip_on_launch = true

  tags = {
    Name = var.subnet_name
  }
}

################################
# Route Table
################################
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.myvpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.myigw.id
  }

  tags = {
    Name = var.route_table_name
  }
}

resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public.id
}

################################
# Security Group
################################
resource "aws_security_group" "mysg" {
  name        = var.security_group_name
  description = "Allow SSH and HTTP"
  vpc_id      = aws_vpc.myvpc.id

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.allowed_ssh_cidr
  }

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = var.allowed_http_cidr
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = var.security_group_name
  }
}

################################
# Key Pair
################################
resource "aws_key_pair" "mykey" {
  key_name   = var.key_pair_name
  public_key = file(var.public_key_path)
}

################################
# EC2 Instance
################################
resource "aws_instance" "Ansible" {
ami                         = var.ami_value
instance_type               = var.instance_type
subnet_id                   = aws_subnet.public.id
vpc_security_group_ids      = [aws_security_group.mysg.id]
key_name                    = aws_key_pair.mykey.key_name
associate_public_ip_address = true


tags = {
Name = var.instance_name
}
}

## outputs.tf

output "vpc_id" {
  value = aws_vpc.myvpc.id
}

output "subnet_id" {
  value = aws_subnet.public.id
}

output "security_group_id" {
  value = aws_security_group.mysg.id
}

output "key_pair_name" {
  value = aws_key_pair.mykey.key_name
}
