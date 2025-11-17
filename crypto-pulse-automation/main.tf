# --- Core Infrastructure ---
module "s3" {
  source      = "./modules/s3-static-site"
  bucket_name = var.bucket_name
}

module "cloudfront" {
  source           = "./modules/cloudfront"
  s3_bucket_domain = module.s3.bucket_name
}

module "route53" {
  source              = "./modules/route53"
  zone_id             = var.zone_id
  domain_name         = var.domain_name
  cloudfront_domain   = module.cloudfront.cloudfront_url
  cloudfront_zone_id  = var.cloudfront_zone_id
}

# --- Phase 2: Resilience & Monitoring ---
module "monitoring" {
  source          = "./modules/monitoring"
  lambda_role_arn = var.lambda_role_arn
}

module "healthcheck" {
  source      = "./modules/route53-healthcheck"
  domain_name = var.domain_name
}

# --- Phase 3: Advanced ---
module "rds" {
  source       = "./modules/rds"
  db_name      = var.db_name
  replica_zone = var.replica_zone
}

module "kinesis" {
  source      = "./modules/kinesis"
  stream_name = var.stream_name
}
