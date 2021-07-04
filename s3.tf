resource "aws_s3_bucket" "website" {
  bucket = var.domain_name
  acl    = "public-read"

  tags = {
    Name        = "Website"
    Environment = var.environment
  }

  cors_rule {
    allowed_headers = ["Authorization", "Content-Length"]
    allowed_methods = ["GET", "POST"]
    allowed_origins = ["https://${var.domain_name}"]
    max_age_seconds = 3000
  }

  website {
    index_document = "index.html"
    error_document = "404.html"
  }
}

resource "aws_s3_bucket_policy" "public_read" {
  bucket = aws_s3_bucket.website.id
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid       = "PublicReadGetObject"
        Effect    = "Allow"
        Principal = "*"
        Action    = "s3:GetObject"
        Resource = [
          aws_s3_bucket.website.arn,
          "${aws_s3_bucket.website.arn}/*",
        ]
      },
    ]
  })
}

resource "aws_s3_bucket" "log_bucket" {
  bucket = "logs-${var.domain_name}"
  acl    = "log-delivery-write"

  tags = {
    Name        = "Website"
    Environment = var.environment
  }
}

resource "aws_s3_bucket" "artifacts_bucket" {
  bucket        = "${var.domain_name}-artifact-build"
  acl           = "private"
}