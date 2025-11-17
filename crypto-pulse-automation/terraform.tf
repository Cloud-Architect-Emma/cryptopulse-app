# main.tf
provider "aws" {
  region  = var.aws_region
  profile = var.aws_profile
}

terraform {
  backend "s3" {
    bucket         = "cryptopulse-terraform-state"
    key            = "global/s3/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}
