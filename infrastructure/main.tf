terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
    random = {
      source = "hashicorp/random"
    }
  }
  backend "remote" {
    organization = "harrison-testing-org"
    workspaces {
      name = "gh-actions-demo"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}

