terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.2.0"
    }

    random = {
      source  = "hashicorp/random"
      version = "3.1.0"
    }
  }
  required_version = ">= 1.1.0"
  
  cloud {
    organization = "YtseJam"

    workspaces {
      name = "canary-rolling"
    }
  }
}