provider "aws" {
  region     = var.aws_region
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

provider "null" {}

provider "archive" {}

provider "github" {
  token   = var.github_token
  owner   = var.github_owner
}

terraform {
  required_version = "1.0.1" 

  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 3.48.0"
    }
    null = {
      source = "hashicorp/null"
      version = "~> 3.1.0"
    }
    archive = {
      source = "hashicorp/archive"
      version = "~> 2.2.0"
    }
    github = {
      source = "integrations/github"
      version = "~> 4.12.1"
    }
  }

  backend "s3" {
    bucket         = var.bucket
    key            = var.key
    region         = var.region
    dynamodb_table = var.dynamodb_table
    encrypt        = true
    versioning     = true
  }
}
