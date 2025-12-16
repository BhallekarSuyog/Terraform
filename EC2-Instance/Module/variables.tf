variable "aws_region" {}
variable "vpc_cidr" {}
variable "public_subnet_cidr" {}
variable "instance_type" {}
variable "ami_id" {}
variable "key_name" {}
variable "allowed_ssh_cidr" {
type = list(string)
}
variable "allowed_http_cidr" {
type = list(string)
}
