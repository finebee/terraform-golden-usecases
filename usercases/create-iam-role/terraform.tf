terraform {
  cloud {
    organization = "finebee"
    workspaces {
      name = "admin-ec2-role"
    }
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
    }
  }

  required_version = ">= 1.9.2"
}
