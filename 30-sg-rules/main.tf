resource "aws_security_group_rule" "backend_alb_bastion" { # backend alb accepting traffic from bastion for testing the private subnet
  security_group_id = local.backend_alb_sg_id
  # cidr_ipv4         = aws_vpc.main.cidr_block
  source_security_group_id = local.bastion_sg_id
  from_port                = 80
  protocol                 = "tcp"
  type                     = "ingress"
  to_port                  = 80
}

resource "aws_security_group_rule" "bastion_laptop" {
  type              = "ingress"
  security_group_id = local.bastion_sg_id
  cidr_blocks = ["0.0.0.0/0"]
  from_port         = 22
  protocol          = "tcp"
  to_port           = 22
}

resource "aws_security_group_rule" "mongodb_bastion"{
  type = "ingress"
  security_group_id = local.mongodb_sg_id
  source_security_group_id = local.bastion_sg_id
  from_port = 22
  protocol = "tcp"
  to_port = 22
}

resource "aws_security_group_rule" "redis_bastion"{
  type = "ingress"
  security_group_id = local.redis_sg_id
  source_security_group_id = local.bastion_sg_id
  from_port = 22
  protocol = "tcp"
  to_port = 22
}

resource "aws_security_group_rule" "rabbitmq_bastion"{
  type = "ingress"
  security_group_id = local.rabbitmq_sg_id
  source_security_group_id = local.bastion_sg_id
  from_port = 22
  protocol = "tcp"
  to_port = 22
}

resource "aws_security_group_rule" "mysql_bastion"{
  type = "ingress"
  security_group_id = local.mysql_sg_id
  source_security_group_id = local.bastion_sg_id
  from_port = 22
  protocol = "tcp"
  to_port = 22
}