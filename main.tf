# VPC

resource "aws_vpc" "vpc-1" {
  cidr_block       = "10.10.0.0/16"
  region = "ap-south-1"

  tags = {
    Name = "vpc-1"
    managed = "terraform"
  }
}


# Subnets

resource "aws_subnet" "vpc-1-tgw-subnet-1" {
  vpc_id     = aws_vpc.vpc-1.id
  cidr_block = "10.10.1.0/24"
  availability_zone = "ap-south-1a"

  tags = {
    Name = "vpc-1-subnet-1"
    managed = "terraform"
  }
}

resource "aws_subnet" "vpc-1-tgw-subnet-2" {
  vpc_id     = aws_vpc.vpc-1.id
  cidr_block = "10.10.2.0/24"
  availability_zone = "ap-south-1b"

  tags = {
    Name = "vpc-1-subnet-2"
    managed = "terraform"
  }
}

# TGW 

data "aws_ec2_transit_gateway" "manual-tgw" {
  id = "tgw-0a69ae1498117108c"
}



#TGW Attachment
