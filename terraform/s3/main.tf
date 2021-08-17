provider "aws" {
  region = "ap-southeast-2"
}

resource "aws_s3_bucket" "terraform_state" {
  bucket = "HSW-TERRAFORM-STATE-UAT"
  versioning {
    enabled = true
  }
}