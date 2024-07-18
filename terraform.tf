terraform {
/*
  cloud {
   organization = "finebee"

   workspaces {
     name = "terraform-golden-usecases"
   }
  }
*/

  required_providers {
    kubiya = {
      source = "kubiya-terraform/kubiya"
    }
  }

  required_version = ">= 0.14.0"
}
