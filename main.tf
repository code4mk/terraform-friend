terraform {
  cloud {
    organization = "terraform_organization_name"
    workspaces {
      tags = ["infra_tag"]
    }
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.8"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = var.region
}