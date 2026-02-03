resource "aws_lb" "backedn_alb"{
    name = "${local.common_name_suffix}-backend-alb"
    internal = true
    load_balancer_type = "application"
    security_groups =[local.backend_alb_sg_id]
    subnets = local.private_subnet_ids

    enable_deletion_protection = true # prevents accidental deletion from UI/terraform

    tags = merge(
        local.common_tags,
        {
            Name = "${local.common_name_suffix}-backend-alb"
        }
    )
}