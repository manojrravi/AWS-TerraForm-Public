# VPC

resource "aws_vpc" "vpc_1" {
  cidr_block       = "10.10.0.0/16"
  region = "ap-south-1"

  tags = {
    Name = "vpc_1"
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

# TGW 

data "aws_ec2_transit_gateway" "manual_tgw" {
  id = "tgw-0a69ae1498117108c"
}



#TGW Attachment
resource "aws_ec2_transit_gateway_vpc_attachment" "vpc_1_attachment" {
  subnet_ids         = [aws_subnet.vpc_1_tgw_subnet_1.id, aws_subnet.vpc_1_tgw_subnet_2.id ]
  transit_gateway_id = data.aws_ec2_transit_gateway.manual_tgw.id
  vpc_id             = aws_vpc.vpc_1.id

  tags = {
    Name = "vpc_1_attachment"
    managed = "terraform"
  }
}