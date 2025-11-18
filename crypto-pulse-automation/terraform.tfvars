# AWS settings
aws_region   = "us-east-1"
aws_profile  = "default"

# S3 + CloudFront (no Route53 domain yet)
bucket_name        = "cryptopulse-site"
zone_id            = ""                        # Leave empty until you create a Route53 hosted zone
domain_name        = ""                        # No custom domain yet, will use CloudFront default
cloudfront_zone_id = "Z2FDTNDATAQYW2"          # AWS global CloudFront zone ID (constant)

# Monitoring
topic_name   = "CryptoPulseAlerts"
alert_email  = "emmanuela_prince@yahoo.com"

# RDS
db_name      = "cryptopulse-db"
replica_zone = "us-east-1b"

# Kinesis
stream_name  = "cryptopulse-stream"

db_password = "SuperSecurePass123!"

