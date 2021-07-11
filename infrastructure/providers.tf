provider "aws" {
  region     = var.aws_region
}

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
