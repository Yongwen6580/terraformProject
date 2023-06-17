provider "aws" {
  region = "us-east-1"
}

resource "aws_vpc" "development-vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    name : "development",
    vpc_env : "dev"
  }
}

//create a resource depend on other resource
resource "aws_subnet" "dev-subnet-1" {
  vpc_id            = aws_vpc.development-vpc.id
  cidr_block        = var.subnet_cidr_block
  availability_zone = "us-east-1a"
  tags = {
    name : "dev-subnet-1"
  }
}

data "aws_vpc" "existing_vpc" {
  default = true
}

variable "subnet_cidr_block" {
  description = "subnet cidr block."
}

variable "vpc_cidr_block" {
  description = "vpc cidr block"
}

resource "aws_vpc" "development_vpc" {
  cidr_block = var.vpc_cidr_block
}




