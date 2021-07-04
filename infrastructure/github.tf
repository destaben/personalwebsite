resource "aws_codepipeline_webhook" "bar" {
  name            = replace("${var.domain_name}-repo-github-webhook", ".", "-")
  authentication  = "GITHUB_HMAC"
  target_action   = "Source"
  target_pipeline = aws_codepipeline.rest_pipeline.name

  authentication_configuration {
    secret_token = var.github_token
  }

  filter {
    json_path    = "$.ref"
    match_equals = "refs/heads/{Branch}"
  }
  tags = merge(
    {
      "Name" = replace("${var.domain_name}-repo-github-webhook", ".", "-")
    }
  )
}

resource "github_repository_webhook" "bar" {
  repository = var.github_repo

  configuration {
    url          = aws_codepipeline_webhook.bar.url
    content_type = "json"
    insecure_ssl = true
    secret       = var.github_token
  }
  events = ["push"]
}