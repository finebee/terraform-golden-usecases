terraform {
  cloud {
    organization = "finebee"
    workspaces {
      name = "resource-lifecycle"
    }
  }

  required_providers {
    kubiya = {
      source = "kubiya-terraform/kubiya"
    }
  }

  required_version = ">= 1.9.2"
}
