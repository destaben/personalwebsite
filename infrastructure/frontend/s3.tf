resource "aws_s3_bucket" "cloudfront_log_bucket" {
  bucket = "cloudwatch-${var.domain_name}"
  acl    = "log-delivery-write"

  tags = {
    Name        = "Website"
    Environment = var.environment
  }
}
