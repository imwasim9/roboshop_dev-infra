terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.16.0"
    }
  }

  backend "s3" {
    bucket       = "remote-state-wasdaws.shop"
    key          = "roboshop-dev-components"
    use_lockfile = true
    region = "us-east-1"
    encrypt      = true
  }
}

provider "aws" {
  
}
