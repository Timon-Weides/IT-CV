output "bucket_name" {
  description = "S3 Bucket Name"
  value       = aws_s3_bucket.website.bucket
}

output "cloudfront_id" {
  description = "CloudFront Distribution ID — für Cache Invalidierung"
  value       = aws_cloudfront_distribution.website.id
}

output "cloudfront_domain" {
  description = "CloudFront Domain"
  value       = "https://${aws_cloudfront_distribution.website.domain_name}"
}

output "website_url" {
  description = "Öffentliche URL"
  value       = "https://timonweides.de"
}