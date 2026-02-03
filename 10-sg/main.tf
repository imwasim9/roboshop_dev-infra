# Using Open source module
# module "catalogue" {
#   source = "terraform-aws-modules/security-group/aws"

#   name        = "${local.common_name_suffix}-catalogue"
#   use_name_prefix = false
#   description = "Security group for catalogue with custom ports open within VPC, egress all traffic"
#   vpc_id      = data.aws_ssm_parameter.vpc_id.value

# }

module "sg" {
  count          = length(var.sg_names)
  source         = "git::https://github.com/imwasim9/terraform_aws_sg.git?ref=main"
  project_name   = var.project_name
  environment    = var.environment
  sg_name        = var.sg_names[count.index]
  sg_description = "Created for ${var.sg_names[count.index]}"
  vpc_id         = local.vpc_id
}

resource "aws_security_group_rule" "frontend_frontend_alb" {
  security_group_id = module.sg[9].sg_id
  # cidr_ipv4         = aws_vpc.main.cidr_block
  source_security_group_id = module.sg[11].sg_id
  from_port                = 80
  protocol                 = "tcp"
  type                     = "ingress"
  to_port                  = 80
}
