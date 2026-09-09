terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }

    random = {
      source  = "hashicorp/random"
      version = "~> 3.7"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "random_string" "bucket_suffix" {
  length  = 8
  special = false
  upper   = false
}

resource "aws_s3_bucket" "tf_test_bucket" {
  bucket = "my-tf-test-bucket-${random_string.bucket_suffix.result}"

  tags = {
    Name        = "My bucket101"
    Environment = "Test"
  }
}

resource "aws_s3_bucket" "tf_dev_bucket" {
  bucket = "my-tf-dev-bucket-${random_string.bucket_suffix.result}"

  tags = {
    Name        = "My bucket102"
    Environment = "Dev"
  }
}
