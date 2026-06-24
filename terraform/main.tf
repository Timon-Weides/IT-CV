# ── S3 ──────────────────────────────────────────────────────
resource "aws_s3_bucket" "website" {
  bucket = "timonweides.de"
  tags   = { Name = "timonweides.de" }
}

# ── CLOUDFRONT ───────────────────────────────────────────────
resource "aws_cloudfront_distribution" "website" {
  enabled             = true
  is_ipv6_enabled     = true
  default_root_object = "index.html"
  aliases             = ["timonweides.de"]
  price_class         = "PriceClass_All"
  web_acl_id          = "arn:aws:wafv2:us-east-1:606349121908:global/webacl/CreatedByCloudFront-66841919/64deab3b-bb4c-49be-8df3-1e556e171a0c"

  origin {
    domain_name = "timonweides.de.s3-website.eu-central-1.amazonaws.com"
    origin_id   = "timonweides.de.s3.eu-central-1.amazonaws.com-mq2kd6zjk8u"

    custom_origin_config {
      http_port                = 80
      https_port               = 443
      origin_protocol_policy   = "http-only"
      origin_read_timeout      = 30
      origin_keepalive_timeout = 5
      origin_ssl_protocols     = ["SSLv3", "TLSv1", "TLSv1.1", "TLSv1.2"]
    }
  }

  default_cache_behavior {
    allowed_methods        = ["GET", "HEAD"]
    cached_methods         = ["GET", "HEAD"]
    target_origin_id       = "timonweides.de.s3.eu-central-1.amazonaws.com-mq2kd6zjk8u"
    viewer_protocol_policy = "redirect-to-https"
    compress               = true
    cache_policy_id        = "658327ea-f89d-4fab-a63d-7e88639e58f6"
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
      locations        = []
    }
  }

  viewer_certificate {
    acm_certificate_arn      = "arn:aws:acm:us-east-1:606349121908:certificate/caba986e-e87a-4453-8c3f-c2eca89dc1b9"
    ssl_support_method       = "sni-only"
    minimum_protocol_version = "TLSv1.2_2021"
  }

  tags = { Name = "timonweides.de" }
}