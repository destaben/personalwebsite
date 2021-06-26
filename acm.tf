resource "aws_acm_certificate" "ssl_certificate" {
  depends_on = [ null_resource.upload_to_s3 ]
  domain_name = var.domain_name
  validation_method = "DNS"

  tags = {
    Name        = "Website"
    Environment = var.environment
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_acm_certificate_validation" "cert_validation" {
  certificate_arn = aws_acm_certificate.ssl_certificate.arn
}