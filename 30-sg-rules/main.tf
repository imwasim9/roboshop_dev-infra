resource "aws_security_group_rule" "backend_alb_bastion" { # backend alb accepting traffic from bastion for testing the private subnet
  security_group_id = local.backend_alb_sg_id
  # cidr_ipv4         = aws_vpc.main.cidr_block
  source_security_group_id = local.bastion_sg_id
  from_port                = 80
  protocol                 = "tcp"
  type                     = "ingress"
  to_port                  = 80
}
