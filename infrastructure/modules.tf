module "frontend" {
  source               = "./frontend"
  aws_region           = var.aws_region
  environment          = var.environment
  domain_name          = var.domain_name
  alerting_sms_number  = var.alerting_sms_number
}

module "build" {
  source              = "./build"
  environment         = var.environment
  aws_region          = var.aws_region
  domain_name         = var.domain_name
  github_token        = var.github_token
  github_repo         = var.github_repo
  github_owner        = var.github_owner
  alerting_sms_number = var.alerting_sms_number
  user_policy_arn     = var.user_policy_arn
}