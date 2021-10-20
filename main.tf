terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
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

