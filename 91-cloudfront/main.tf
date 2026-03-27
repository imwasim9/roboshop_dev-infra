resource "aws_cloudfront_distribution" "roboshop" {
    origin {
        domain_name = "${var.project_name}-${var.environment}.${var.domain_name}"
        origin_id = "${var.project_name}-${var.environment}.${var.domain_name}"
        custom_origin_config {
          http_port = 80
          https_port = 443
          origin_protocol_policy = "https-only"
          origin_ssl_protocols = ["TLSv1.2"]
        }
    }
    enabled = true
    aliases = ["${var.environment}.${var.domain_name}"]
    default_cache_behavior {
      allowed_methods  = ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
      cached_methods = ["GET", "HEAD"]
      target_origin_id = "${var.project_name}-${var.environment}.${var.domain_name}"
      viewer_protocol_policy = "https-only"
      cache_policy_id = local.cachingDisabled
    }

    ordered_cache_behavior {
      path_pattern = "/media/*"
      allowed_methods = ["GET", "HEAD", "OPTIONS"]
      cache_methods = ["GET", "HEAD", "OPTIONS"]
      target_origin_id = "${var.project_name}-${var.enviroment}.${var.domain_name}"
      viewer_protocol_policy = "https-only"
      cache_policy_id = local.cachingOptimised
    }
}