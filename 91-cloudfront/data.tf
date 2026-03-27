data "aws_cloudfront_cache_policy" "cachingOptimised"{
    name = "Managed-CachingOptimized"
}

data "aws_cloudfront_cache_policy" "cachingDisabled" {
    name = "Managed-CachingDisabled"
}

data "aws_ssm_parameter" "certificate_arn" {
    name = "/${var.project_name}/${var.environment}/frontend_alb_certificate_arn"
}

data "aws_route53_zone" "zone"{
    name = var.domain_name
    private_zone = false
}