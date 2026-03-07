# VPC

resource "aws_vpc" "vpc_1" {
  cidr_block       = "10.10.0.0/16"
  region = "ap-south-1"

  tags = {
    Name = "vpc_1"
    managed = "terraform"
  }
}

# Internet GW

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.vpc_1.id

  tags = {
    Name = "vpc_1_IGW"
    managed = "terraform"
  }
}


# Subnets

resource "aws_subnet" "vpc_1_tgw_subnet_1" {
  vpc_id     = aws_vpc.vpc_1.id
  cidr_block = "10.10.1.0/24"
  availability_zone = "ap-south-1a"

  tags = {
    Name = "vpc_1_subnet_1"
    managed = "terraform"
  }
}

resource "aws_subnet" "vpc_1_tgw_subnet_2" {
  vpc_id     = aws_vpc.vpc_1.id
  cidr_block = "10.10.2.0/24"
  availability_zone = "ap-south-1b"

  tags = {
    Name = "vpc_1_subnet_2"
    managed = "terraform"
  }
}


#Load Balancer Subnet

resource "aws_subnet" "vpc_1_lb_subnet_1" {
  vpc_id     = aws_vpc.vpc_1.id
  cidr_block = "10.10.10.0/24"
  availability_zone = "ap-south-1a"

  tags = {
    Name = "vpc_1_lb_subnet_1"
    managed = "terraform"
  }
}

resource "aws_subnet" "vpc_1_lb_subnet_2" {
  vpc_id     = aws_vpc.vpc_1.id
  cidr_block = "10.10.11.0/24"
  availability_zone = "ap-south-1b"

  tags = {
    Name = "vpc_1_lb_subnet_2"
    managed = "terraform"
  }
}

resource "aws_subnet" "test" {
  vpc_id     = aws_vpc.vpc_1.id
  cidr_block = "10.10.12.0/24"
  availability_zone = "ap-south-1b"

  tags = {
    Name = "test-1"
    managed = "terraform"
  }
}