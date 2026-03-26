terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.27.0"
    }
  }

  backend "s3" {
    bucket       = "remote-state-wasdaws.shop"
    key          = "roboshop-dev-vpn"
    use_lockfile = false
    region = "us-east-1"
    encrypt      = true
  }
}

provider "aws" {
  
}
