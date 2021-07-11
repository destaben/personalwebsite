resource "aws_iam_role" "pipeline_role" {
  assume_role_policy = jsonencode(
    {
      Statement = [
        {
          Action = "sts:AssumeRole"
          Effect = "Allow"
          Principal = {
            Service = "codepipeline.amazonaws.com"
          }
        },
      ]
      Version = "2012-10-17"
    }
  )

  force_detach_policies = false
  max_session_duration  = 3600
  name                  = "pipeline-role-${var.environment}"
  path                  = "/service-role/"
  tags                  = {}
}

resource "aws_iam_policy" "pipeline_policy" {
  description = "Policy used in trust relationship with CodePipeline"
  name        = "pipeline-policy-${var.environment}"
  path        = "/service-role/"
  policy = jsonencode(
    {
      Statement : [
        {
          Action : [
            "codebuild:BatchGetBuilds",
            "codebuild:StartBuild",
            "codestar-connections:*",
            "codecommit:GetBranch"
          ],
          Resource : "*",
          Effect : "Allow"
        },
      ],
      "Version" : "2012-10-17"
    }
  )
}

resource "aws_iam_role_policy_attachment" "pipeline_policy_attachment" {
  role       = aws_iam_role.pipeline_role.name
  policy_arn = aws_iam_policy.pipeline_policy.arn
}

resource "aws_iam_role" "static_build_role" {
  assume_role_policy = jsonencode(
    {
      Statement = [
        {
          Action = "sts:AssumeRole"
          Effect = "Allow"
          Principal = {
            Service = "codebuild.amazonaws.com"
          }
        }
      ]
      Version = "2012-10-17"
    }
  )
  force_detach_policies = false
  max_session_duration  = 3600
  name                  = "build-role-${var.environment}"
  path                  = "/service-role/"
  tags                  = {}
}

resource "aws_iam_policy" "build_policy" {
  description = "Policy used in trust relationship with CodeBuild (${var.environment})"
  name        = "build-policy-${var.environment}"
  path        = "/service-role/"
  policy = jsonencode(
    {
      Statement = [
        {
          "Effect" = "Allow",
          "Action" = [
            "cloudfront:*"
          ],
          "Resource" = [
            "*"
          ]
        },
        {
          "Action" : [
            "logs:CreateLogGroup",
            "logs:CreateLogStream",
            "logs:PutLogEvents"
          ],
          "Effect" : "Allow",
          "Resource" : "arn:aws:logs:*"
        }
      ]
      Version = "2012-10-17"
    }
  )
}


resource "aws_iam_role_policy_attachment" "build_policy_attachment" {
  role       = aws_iam_role.static_build_role.name
  policy_arn = aws_iam_policy.build_policy.arn
}

resource "aws_iam_role_policy_attachment" "pipeline_policy_attachment_user_policy" {
  role       = aws_iam_role.pipeline_role.name
  policy_arn = var.user_policy_arn
}

resource "aws_iam_role_policy_attachment" "build_policy_attachment_user_policy" {
  role       = aws_iam_role.static_build_role.name
  policy_arn = var.user_policy_arn
}