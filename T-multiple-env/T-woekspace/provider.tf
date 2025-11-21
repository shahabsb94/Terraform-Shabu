terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "5.84.0"
    }
  }
  backend "s3" {
    bucket = "shabu-remote-tf"
    key    = "shabu-expense"
    region = "us-east-1"
    dynamodb_table = "shabu-remote-tf"
  }
}

provider "aws" {
    region = "us-east-1"
}