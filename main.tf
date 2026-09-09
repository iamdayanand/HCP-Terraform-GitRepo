terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

provider "aws" {
  # Configuration options
    region = "us-east-1"
}

# Create a S3 bucket
resource "aws_s3_bucket" "tf_test_bucket" {
  bucket = "my-tf-test-bucket-101"

  tags = {
    Name        = "My bucket101"
    Environment = "Test"
  }
}
# Create a S3 bucket
resource "aws_s3_bucket" "tf_dev_bucket" {
  bucket = "my-tf-dev-bucket-102"

  tags = {
    Name        = "My bucket102"
    Environment = "Dev"
  }
}
