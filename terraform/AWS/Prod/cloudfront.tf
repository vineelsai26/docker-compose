resource "aws_cloudfront_origin_access_control" "repo" {
  name                              = "repo_access_control"
  description                       = "Access control for blog S3 bucket"
  origin_access_control_origin_type = "s3"
  signing_behavior                  = "always"
  signing_protocol                  = "sigv4"
}

locals {
  s3_origin_id = "S3Origin"
}

resource "aws_cloudfront_distribution" "s3_distribution" {
  origin {
    domain_name              = aws_s3_bucket.repo.bucket_regional_domain_name
    origin_access_control_id = aws_cloudfront_origin_access_control.repo.id
    origin_id                = local.s3_origin_id
  }

  enabled             = true
  is_ipv6_enabled     = true
  comment             = "Repo Distribution"

  aliases = ["repo.vineelsai.com"]

  # AWS Managed Caching Policy (CachingOptimized)
  default_cache_behavior {
    # Using the CachingOptimized managed policy ID:
    cache_policy_id        = "658327ea-f89d-4fab-a63d-7e88639e58f6"
    cached_methods         = ["GET", "HEAD"]
    allowed_methods        = ["GET", "HEAD", "OPTIONS"]
    target_origin_id       = local.s3_origin_id
    viewer_protocol_policy = "redirect-to-https"
  }


  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  tags = {
    Environment = "production"
  }

  viewer_certificate {
    cloudfront_default_certificate = true
    acm_certificate_arn            = module.repo_acm.arn
    minimum_protocol_version       = "TLSv1.2_2019"
    ssl_support_method             = "sni-only"
  }
}