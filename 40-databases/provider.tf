terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.16.0"
    }
  }

  backend "s3" {
    bucket       = "remotestate-wasdaws"
    key          = "roboshop-dev-database_bastion"
    use_lockfile = true
    region = "us-east-1"
    encrypt      = true
  }
}

provider "aws" {
  
}
