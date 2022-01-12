terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.71"
    }
  }

  required_version = ">= 1.1.3."
}

# To create a VPC and Internet Gateway
/*resource "aws_vpc" "default-vpc" {
  cidr_block       = "${var.vpc_cidr}"
  instance_tenancy = "default"

  tags = {
    Name = "VPC"
  }
}

# To create an Internet Gateway
resource "aws_internet_gateway" "default-igw" {
  vpc_id = aws_vpc.default-vpc.id

  tags = {
    Name = "IGW"
  }
}

*/

# Use existing VPC that will not be managed by terraform
data "aws_vpc" "default-vpc" {
  id = var.vpc_id
    tags = {
        Name = "Default-VPC"
  }
}

# Use existing Internet Gateway
data "aws_internet_gateway" "default-igw" {
  filter {
    name   = "attachment.vpc-id"
    values = [var.vpc_id]
  }
}

/*# Use existing NAT Gateway
data "aws_nat_gateway" "default" {
#    subnet_id = aws_subnet.ter-public.id
    tags = {
        Name = "Default"
 }
}*/

# To create a public subnet for apache webserver
resource "aws_subnet" "pubsub_mw" {
  vpc_id     = aws_vpc.default-vpc.id
  cidr_block = "${var.vpc_cidr}"

  tags = {
    Name = "PubSubMW"
  }
}

# To create a private subnet for DB server
resource "aws_subnet" "privsub_db" {
  vpc_id     = aws_vpc.default-vpc.id
  cidr_block = "${var.vpc_cidr}"

  tags = {
    Name = "PrivSubDB"
  }
}

# To create route table for webserver
resource "aws_route_table" "pubsub_mw_rt" {
  vpc_id = aws_vpc.default-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.default-igw.id
}

  tags = {
    Name = "webserver_rt"
  }
}

resource "aws_route_table_association" "pubsub_as" {
  subnet_id      = aws_subnet.pubsub_mw.id
  route_table_id = aws_route_table.pubsub_mw_rt.id
}

# Add security groups for accessing webserver
resource "aws_security_group" "pubsub_sg" {
  vpc_id      = "${aws_vpc.default-vpc.id}"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }
}

# To create a webserver instance
resource "aws_instance" "webserver_mw" {
  ami           = "{var.ami_id}"
  instance_type = "t3.micro"

  tags = {
    Name = "MediaWiki"
  }
}

# To create route table for dbserver
resource "aws_route_table" "privsub_db_rt" {
  vpc_id = aws_vpc.default-vpc.id

  route {
    cidr_block = "${var.vpc_cidr}"
    gateway_id = aws_internet_gateway.example.id
  }

  tags = {
    Name = "dbserver_rt"
  }
}
