resource "aws_key_pair" "ansible" {
  key_name   = "var.key_pair_name"  # Replace with your desired key name
  public_key = "var.public_key_path"  # Replace with the path to your public key                                                 key file
}

resource "aws_vpc" "Ansible-VPC" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "Ansible-pub-sub" {
  vpc_id                  = aws_vpc.Ansible-VPC.id
  cidr_block              = "10.0.0.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true
}

resource "aws_internet_gateway" "Ansible-igw" {
  vpc_id = aws_vpc.Ansible-VPC.id
}

resource "aws_route_table" "Ansible-RT" {
  vpc_id = aws_vpc.Ansible-VPC.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.Ansible-igw.id
  }
}

resource "aws_route_table_association" "rta1" {
  subnet_id      = aws_subnet.Ansible-pub-sub.id
  route_table_id = aws_route_table.Ansible-RT.id
}

resource "aws_security_group" "Ansible-SG" {
  name   = "Ansible-SG"
  vpc_id = aws_vpc.Ansible-VPC.id

  ingress {
    description = "HTTP from VPC"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "ansible-sg"
  }
}

resource "aws_instance" "Ansible-server" {
  ami                    = "ami-0ecb62995f68bb549"
  instance_type          = "t3.micro"
  key_name               = aws_key_pair.ansible.key_name
  vpc_security_group_ids = [aws_security_group.Ansible-SG.id]
  subnet_id              = aws_subnet.Ansible-pub-sub.id

  }
