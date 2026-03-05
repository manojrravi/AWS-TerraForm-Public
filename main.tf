# VPC

resource "aws_vpc" "vpc-1" {
  cidr_block       = "10.10.0.0/16"
  region = ap-south-2

  tags = {
    Name = "vpc-1"
  }
}