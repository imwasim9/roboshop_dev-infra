data "aws_ami" "joindevops"{
    owners = ["973714476881"]
    most_recent = true
    filter {
        name = "root-device-type"
        values = ["ebs"]
    }
}

data "aws_ssm_parameter" "catalogue_sg_id"{
    name = "/${var.project_name}/${var.env}/catalogue_sg_id"
}


data "aws_ssm_parameter" "private_subnet_ids" {
  name = "/${var.project_name}/${var.env}/private_subnet_ids"
}

data "aws_route53_zone" "zone"{
    name = var.domain_name
    private_zone = false
}

data "aws_ssm_parameter" "vpc_id" {
  name = "/${var.project_name}/${var.env}/vpc_id"
}

data "aws_ssm_parameter" "backend_alb_listener_arn"{
    name = "/${var.project_name}/${var.env}/backend_alb_listener_arn"
}