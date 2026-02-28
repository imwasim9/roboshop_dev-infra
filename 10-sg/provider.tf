terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.27.0"
    }
  }

  backend "s3" {
    bucket       = "remote-state-wasdaws.shop"
    key          = "roboshop-sg"
    use_lockfile = true
    region = "us-east-1"
    encrypt      = true
  }
}

provider "aws" {
  
}
