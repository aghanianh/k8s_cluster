terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  backend "s3" {
    bucket = "eks-cluster-tf-state-varuj"
    key    = "terraform.tfstate"
    region = "us-west-2"
    dynamodb_table = "eks-cluster-tf-locks"
    encrypt = true
    
  }
}

provider "aws" {
  region = var.region
}
