# Week 4: Infrastructure as Code - AWS Architecture Provisioning

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

# 1. Create a Secure Custom VPC
resource "aws_vpc" "intern_vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
  tags = {
    Name = "ICP-Internship-VPC"
  }
}

# 2. Public Subnet for App Hosts
resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.intern_vpc.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true
  tags = {
    Name = "ICP-Public-Subnet"
  }
}

# 3. Security Group Layout allowing HTTP & SSH Access
resource "aws_security_group" "app_sg" {
  name        = "icp-app-security-group"
  description = "Allow inbound web and management traffic"
  vpc_id      = aws_vpc.intern_vpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# 4. Compute EC2 Instance Layer
resource "aws_instance" "devops_server" {
  ami           = "ami-0c7217cdde317cfec" # Ubuntu 22.04 LTS Base
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.public_subnet.id
  vpc_security_group_ids = [aws_security_group.app_sg.id]

  tags = {
    Name = "ICP-DevOps-Target-Host"
  }
}