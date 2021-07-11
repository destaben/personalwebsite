output "website_endpoint" {
    value = aws_s3_bucket.website.website_endpoint
}

output "certificate_arn" {
    value = aws_acm_certificate_validation.cert_validation.certificate_arn
}