terraform {
  required_providers {
    aws = {
      ssource = "hashicorp/aws"
    }
    random = {
      sosource = "hashicorp/random"
    }
  }
  backend "remote" {
    organization = "harrison-testing-org"
    workspaces {
      name = "gh-actions-demo"
    }
  }
}

