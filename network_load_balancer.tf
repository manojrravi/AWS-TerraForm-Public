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


# LB Traget Group

resource "aws_lb_target_group" "app-1-nlb-tg" {
  name        = "app-1-nlb-tg"
  port        = 80
  protocol    = "TCP"
  target_type = "ip"
  vpc_id      = aws_vpc.vpc_1.id
}

# LB Listner

resource "aws_lb_listener" "app_1_listner" {
  load_balancer_arn = aws_lb.network_lb.arn
  port              = "80"
  protocol          = "TCP"
  #ssl_policy        = "ELBSecurityPolicy-2016-08"
  #certificate_arn   = "arn:aws:iam::187416307283:server-certificate/test_cert_rab3wuqwgja25ct3n4jdj2tzu4"


  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.app-1-nlb-tg.arn
  }
}