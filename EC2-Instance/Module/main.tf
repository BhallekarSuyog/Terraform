module "ec2" {
source = "./modules/ec2"

vpc_cidr = var.vpc_cidr
subnet_cidr = var.public_subnet_cidr
instance_type = var.instance_type
ami_id = var.ami_id
key_name = var.key_name
allowed_ssh_cidr = var.allowed_ssh_cidr
allowed_http_cidr = var.allowed_http_cidr
}
