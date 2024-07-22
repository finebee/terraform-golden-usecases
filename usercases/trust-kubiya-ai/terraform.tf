terraform {
  cloud {
    organization = "finebee"
    workspaces {
      name = "trust-kubiya-ai"
    }
  }

  required_providers {
    aws = {
      source = "hashicorp/aws"
    }

    kubiya = {
      source = "kubiya-terraform/kubiya"
    }
  }

  required_version = "~> 1.2"
}
