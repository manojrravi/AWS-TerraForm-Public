# VPC

resource "aws_vpc" "ap-south-1-vpc-1" {
  cidr_block       = "10.10.0.0/16"
  region = "ap-south-1"

  tags = {
    Name = "ap-south-1-vpc-1"
  }
}