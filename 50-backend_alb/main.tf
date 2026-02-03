resource "aws_lb" "backend-alb" {
  name               = "${local.common_name_suffix}-backend-alb"
  internal           = true
  load_balancer_type = "application"
  security_groups    = [local.backend_alb_sg_id]
  subnets            = toset(local.private_subnet_ids)

  enable_deletion_protection = true # prevents accidental deletion from UI/terraform

  tags = merge(
    local.common_tags,
    {
      Name = "${local.common_name_suffix}-backend-alb"
    }
  )
}

resource "aws_lb_listener" "backend" {
  load_balancer_arn = aws_lb.backend-alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type = "fixed-response"
    fixed_response {
      content_type = "text/plain"
      message_body = "Hi, I am from backend alb HTTP"
      status_code  = "200"
    }
  }
}
