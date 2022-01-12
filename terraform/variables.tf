variable "aws_access_key" {}
variable "aws_secret_key" {}
variable "aws_key_path" {}
variable "aws_key_name" {}

variable "aws_region" {
    description = "EC2 Region for the VPC"
    type = string
    default = "us-east-1"
}

variable "vpc_id" {
   description = "VPC ID"
   default = "vpc-0fd84c72"
}

variable "public_subnet_cidr" {
    description = "CIDR for the Public Subnet"
    default = "172.31.99.0/24"
}

variable "private_subnet_cidr" {
    description = "CIDR for the Private Subnet"
    default = "172.31.100.0/24"
}

/*
variable "web_instance" {
   description = "Webserver Instance"
   default = "i-0661793dfffadf19b"
}
*/
variable "ami_id" {
   description = "AMI for webserver"
   default = "ami-08e4e35cccc6189f4"
}


variable "vpc_cidr" {
    description = "CIDR for the default VPC"
    default = "172.31.0.0/16"
}
