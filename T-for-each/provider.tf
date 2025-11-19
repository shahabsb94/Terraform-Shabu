terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.84.0"
    }
  }
  # backend "s3" {
  #   bucket = "shabu-tf-remote-state"
  #   key    = "ec2-s3"
  #   region = "us-east-1"
  #   dynamodb_table = "sd-tf-remote-state"
  # }
}

provider "aws" {
  region = "us-east-1"
}