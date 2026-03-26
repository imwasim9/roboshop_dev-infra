data "aws_ami" "openvpn" {
    owners           = ["108836621757"]
    most_recent      = true
    
    # filter {
    #     name   = "name"
    #     values = ["OpenVPN Access Server Community Image-fe8020db-*"]
    # }

    filter {
        name   = "virtualization-type"
        values = ["hvm"]
    }
}

data "aws_ssm_parameter" "openvpn_sg_id" {
  name = "/${var.project_name}/${var.environment}/openvpn_sg_id"
}

data "aws_ssm_parameter" "public_subnet_ids" {
  name = "/${var.project_name}/${var.environment}/public_subnet_ids"
}
data "aws_route53_zone" "zone"{
    name = var.domain_name
    private_zone = false
}