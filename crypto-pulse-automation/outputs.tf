output "s3_bucket" {
  description = "Name of the S3 bucket hosting the static site"
  value       = module.s3.bucket_name
}

output "cloudfront_url" {
  description = "Domain name of the CloudFront distribution"
  value       = module.cloudfront.cloudfront_url
}

output "health_check_id" {
  description = "ID of the Route53 health check"
  value       = module.route53_health.health_check_id
}

# Remove or comment out alarm_name until monitoring module exports it
# output "alarm_name" {
#   description = "Name of the CloudWatch alarm that triggers remediation"
#   value       = module.monitoring.alarm_name
# }

output "rds_primary" {
  description = "ID of the primary RDS instance"
  value       = module.rds_replica.primary_id
}

output "rds_replica" {
  description = "ID of the replica RDS instance"
  value       = module.rds_replica.replica_id
}

output "sns_topic_arn" {
  description = "ARN of the SNS topic for alerts"
  value       = module.sns.sns_topic_arn
}
