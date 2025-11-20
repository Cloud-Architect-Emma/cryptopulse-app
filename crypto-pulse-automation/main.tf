terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    archive = {
      source  = "hashicorp/archive"
      version = "~> 2.0"
    }
  }

  backend "s3" {
    bucket = "cryptopulse-terraform-state"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region  = var.aws_region
  profile = var.aws_profile
}

# --- VPC (network foundation) ---
module "vpc" {
  source = "./modules/vpc"
}

# --- S3 Static Site ---
module "s3" {
  source      = "./modules/s3"
  bucket_name = var.bucket_name
}

# --- CloudFront Distribution ---
module "cloudfront" {
  source           = "./modules/cloudfront"
  s3_bucket_domain = module.s3.bucket_domain
}

# --- Route53 Health Check ---
module "route53_health" {
  source = "./modules/route53_health"
  fqdn   = module.cloudfront.cloudfront_url
}

# --- SNS Alerts ---
module "sns" {
  source      = "./modules/sns"
  topic_name  = var.topic_name
  alert_email = var.alert_email
}

# --- Monitoring (Lambda + IAM + CloudWatch) ---
module "monitoring" {
  source        = "./modules/monitoring"
  sns_topic_arn = module.sns.sns_topic_arn
}

# --- RDS with Replica ---
module "rds_replica" {
  source       = "./modules/rds_replica"
  db_name      = var.db_name
  subnet_ids   = [module.vpc.public_a_id, module.vpc.public_b_id]
  replica_zone = var.replica_zone
  db_password  = var.db_password
}
