locals {
  common_name_suffix = "${var.project_name}-${var.env}" # roboshop-dev
  catalogue_sg_id      = data.aws_ssm_parameter.catalogue_sg_id.value
  redis_sg_id        = data.aws_ssm_parameter.redis_sg_id.value
  rabbitmq_sg_id     = data.aws_ssm_parameter.rabbitmq_sg_id.value
  mysql_sg_id        = data.aws_ssm_parameter.mysql_sg_id.value
  database_subnet_id = split(",", data.aws_ssm_parameter.private_subnet_ids.value)[0]
  ami_id             = data.aws_ami.joindevops.id
  common_tags = {
    Project     = var.project_name
    Environment = var.env
    Terraform   = "true"
  }
  zone_id = data.aws_route53_zone.zone_id.value
}
