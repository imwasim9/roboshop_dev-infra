locals {
  common_name_suffix = "${var.project_name}-${var.env}" # roboshop-dev
  zone_id = data.aws_route53_zone.zone.zone_id

  common_tags = {
    Project     = var.project_name
    Environment = var.env
    Terraform   = "true"
  }
}
