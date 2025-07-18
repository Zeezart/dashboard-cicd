output "s3_website_url" {
  value = aws_s3_bucket.react_s3.website_endpoint
}

output "cloudfront_url" {
  value = aws_cloudfront_distribution.cdn.domain_name
}
