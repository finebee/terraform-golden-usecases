terraform {
  cloud {
    organization = "finebee"
    workspaces {
      name = "readonly-s3-role"
    }
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.28.00"
    }

    kubiya = {
      source = "kubiya-terraform/kubiya"
    }
  }

  required_version = ">= 1.9.2"
}
