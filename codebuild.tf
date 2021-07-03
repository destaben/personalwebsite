data "aws_caller_identity" "current" {}

resource "aws_codebuild_project" "project_cb" {
  badge_enabled  = false
  build_timeout  = 60
  name           = replace("${var.domain_name}-project-build", ".", "-")
  queued_timeout = 480
  service_role   = aws_iam_role.static_build_role.arn
  tags = merge(
    {
      "Name" = "${var.domain_name}-project-build"
    }
  )

  artifacts {
    encryption_disabled    = false
    name                   = replace("${var.domain_name}-build-${var.environment}", ".", "-")
    override_artifact_name = false
    packaging              = "NONE"
    type                   = "CODEPIPELINE"
  }

  environment {
    compute_type                = "BUILD_GENERAL1_SMALL"
    image                       = "aws/codebuild/amazonlinux2-x86_64-standard:2.0"
    image_pull_credentials_type = "CODEBUILD"
    privileged_mode             = true
    type                        = "LINUX_CONTAINER"

    environment_variable {
      name  = "AWS_REGION"
      value = var.aws_region
    }

    environment_variable {
      name  = "AWS_ACCESS_KEY"
      value = var.aws_access_key
    }

    environment_variable {
      name  = "AWS_SECRET_KEY"
      value = var.aws_secret_key
    }

    environment_variable {
      name  = "GITHUB_TOKEN"
      value = var.github_token
    }

    environment_variable {
      name  = "ALERTING_SMS_NUMBER"
      value = var.alerting_sms_number
    }
  }

  logs_config {
    cloudwatch_logs {
      status = "ENABLED"
    }

    s3_logs {
      encryption_disabled = false
      status              = "DISABLED"
    }
  }

  source {
    git_clone_depth     = 0
    insecure_ssl        = false
    report_build_status = false
    type                = "CODEPIPELINE"
  }
}