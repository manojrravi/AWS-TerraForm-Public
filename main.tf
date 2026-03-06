# VPC

resource "aws_vpc" "vpc-1" {
  cidr_block       = "10.10.0.0/16"
  region = "ap-south-1"

  tags = {
    Name = "vpc-1"
    managed = "terraform"
  }
}


# TGW 

data "aws_ec2_transit_gateway" "manual-tgw" {
  id = "tgw-0a69ae1498117108c"
}