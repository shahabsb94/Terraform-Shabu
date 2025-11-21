terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "5.84.0"
    }
  }
  backend "s3" {
    bucket = "shabu-remote-tf"
    key = "vpc-module-test"
    dynamodb_table = "shabu-remote-tf"
    region = "us-east-1"
  }
}

provider "aws" {
    region = "us-east-1"
}