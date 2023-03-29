terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

# Configure the AWS Provider
# provider "aws" {
#   region = "us-east-2"
# }

provider "aws" {
  region     = "us-east-2"
  access_key = "AKIAT5RWLVEMPH44YDAC"
  secret_key = "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"
}
