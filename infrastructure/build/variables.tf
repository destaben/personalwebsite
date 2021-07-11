
variable "environment" {
    type = string
}

variable "domain_name" {
    type = string
}

variable "github_token" {
  type        = string
  description = "Github token"
}

variable "github_repo" {
  type        = string
  description = "Github repo"
}

variable "github_owner" {
  type        = string
  description = "Github owner"
}

variable "alerting_sms_number" {
  type        = string
  description = "SMS for alerting"
}
