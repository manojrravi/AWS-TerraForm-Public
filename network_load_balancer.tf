resource "aws_lb" "network_lb" {
  name               = "app-1-nlb"
  load_balancer_type = "network"

  subnet_mapping {
    subnet_id            = aws_subnet.vpc_1_lb_subnet_2.id
    #private_ipv4_address = "10.0.1.15"
  }

  subnet_mapping {
    subnet_id            = aws_subnet.vpc_1_lb_subnet_1.id
    #private_ipv4_address = "10.0.2.15"
  }
}