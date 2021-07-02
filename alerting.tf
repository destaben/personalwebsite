resource "aws_cloudwatch_metric_alarm" "failed_build_alarm" {
  alarm_name                = replace("${var.domain_name}-failed-build-alarm", ".", "-")
  comparison_operator       = "GreaterThanOrEqualToThreshold"
  evaluation_periods        = "2"
  metric_name               = "FailedBuilds"
  namespace                 = "AWS/CodeBuild"
  period                    = "360"
  statistic                 = "Maximum"
  threshold                 = "1"
  alarm_description         = "Metric to monitor failed builds"
  insufficient_data_actions = []
  actions_enabled           = "true"
  alarm_actions             = [aws_sns_topic.build_failed_sns.arn]
}

resource "aws_sns_topic" "build_failed_sns" {
  name = replace("${var.domain_name}-failed-build-sns", ".", "-")
}

resource "aws_sns_topic_subscription" "build_failed_sns_sqs_target" {
  topic_arn = aws_sns_topic.build_failed_sns.arn
  protocol  = "sms"
  endpoint  = var.alerting_sms_number
}

resource "aws_cloudwatch_metric_alarm" "http_4xx_errors" {
  alarm_name                = replace("${var.domain_name}-4xx-errors", ".", "-")
  comparison_operator       = "GreaterThanOrEqualToThreshold"
  evaluation_periods        = "2"
  metric_name               = "4xxErrorRate"
  namespace                 = "AWS/CloudFront"
  period                    = "360"
  statistic                 = "Maximum"
  threshold                 = "10"
  alarm_description         = "4XX high error rate on ${var.domain_name} > 10"
  insufficient_data_actions = []
  actions_enabled           = "true"
  alarm_actions             = [aws_sns_topic.http_4xx_sns.arn]
}

resource "aws_sns_topic" "http_4xx_sns" {
  name = replace("${var.domain_name}-failed-build-sns", ".", "-")
}

resource "aws_sns_topic_subscription" "http_4xx_sns_sqs_target" {
  topic_arn = aws_sns_topic.http_4xx_sns.arn
  protocol  = "sms"
  endpoint  = var.alerting_sms_number
}

resource "aws_cloudwatch_metric_alarm" "http_5xx_errors" {
  alarm_name                = replace("${var.domain_name}-5xx-errors", ".", "-")
  comparison_operator       = "GreaterThanOrEqualToThreshold"
  evaluation_periods        = "2"
  metric_name               = "5xxErrorRate"
  namespace                 = "AWS/CloudFront"
  period                    = "360"
  statistic                 = "Maximum"
  threshold                 = "5"
  alarm_description         = "5XX high error rate on ${var.domain_name} > 5"
  insufficient_data_actions = []
  actions_enabled           = "true"
  alarm_actions             = [aws_sns_topic.http_5xx_sns.arn]
}

resource "aws_sns_topic" "http_5xx_sns" {
  name = replace("${var.domain_name}-failed-build-sns", ".", "-")
}

resource "aws_sns_topic_subscription" "http_5xx_sns_sqs_target" {
  topic_arn = aws_sns_topic.http_5xx_sns.arn
  protocol  = "sms"
  endpoint  = var.alerting_sms_number
}