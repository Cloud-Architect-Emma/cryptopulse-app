# modules/s3/main.tf

# S3 bucket
resource "aws_s3_bucket" "site" {
  bucket = var.bucket_name
}

# Ownership controls (required for public buckets in newer provider versions)
resource "aws_s3_bucket_ownership_controls" "site" {
  bucket = aws_s3_bucket.site.id

  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

# Public access block (set to false for static site hosting)
resource "aws_s3_bucket_public_access_block" "site" {
  bucket                  = aws_s3_bucket.site.id
  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

# ACL (separate resource, replaces deprecated inline argument)
resource "aws_s3_bucket_acl" "site_acl" {
  bucket = aws_s3_bucket.site.id
  acl    = "public-read"

  depends_on = [aws_s3_bucket_ownership_controls.site]
}

# Website configuration (separate resource, replaces deprecated inline block)
resource "aws_s3_bucket_website_configuration" "site" {
  bucket = aws_s3_bucket.site.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }
}

# Outputs
output "bucket_name" {
  description = "Name of the S3 bucket"
  value       = aws_s3_bucket.site.bucket
}

output "bucket_domain" {
  description = "Regional domain name of the S3 bucket"
  value       = aws_s3_bucket.site.bucket_regional_domain_name
}
