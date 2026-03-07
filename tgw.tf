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