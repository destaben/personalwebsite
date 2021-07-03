provider "aws" {
  version    = "~> 3.44.0"
  region     = var.aws_region
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

provider "null" {
  version    = "~> 3.1.0"
}

provider "archive" {
  version    = "~> 2.2.0"
}

provider "github" {
  token   = var.github_token
  owner   = var.github_owner
  version = "~> 4.12.1"
}

terraform {
  backend "s3" {
    bucket         = var.bucket
    key            = var.key
    region         = var.region
    dynamodb_table = var.dynamodb_table
    encrypt        = true
    versioning     = true
  }
}
