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