variable "aws_region" {
    type = string
}

variable "environment" {
    type = string
}

variable "domain_name" {
    type = string
}

variable "alerting_sms_number" {
  type        = string
  description = "SMS for alerting"
}

variable "website_endpoint" {
  type        = string
  description = "Website endpoint"
}

variable "certificate_arn" {
  type        = string
  description = "Certificate ARN"
}