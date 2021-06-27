output "s3_distribution" {
    value = "Create a CNAME entry in your DNS provider with ${var.domain_name} as key and ${aws_cloudfront_distribution.s3_distribution.domain_name} as value."
}