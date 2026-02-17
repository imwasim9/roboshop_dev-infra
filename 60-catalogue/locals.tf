locals {
  common_name_suffix = "${var.project_name}-${var.env}" # roboshop-dev
  database_subnet_id = split(",", data.aws_ssm_parameter.private_subnet_ids.value)[0]
  ami_id             = data.aws_ami.joindevops.id
  common_tags = {
    Project     = var.project_name
    Environment = var.env
    Terraform   = "true"
  }
  catalogue_sg_id = data.aws_ssm_parameter.catalogue_sg_id.value
  zone_id = data.aws_route53_zone.zone.zone_id
}
