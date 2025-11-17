output "cdn_url" {
  value = module.cloudfront.cloudfront_url
}

output "dns_record" {
  value = module.route53.domain_name
}

output "alarm_name" {
  value = module.monitoring.alarm_name
}

output "health_check_id" {
  value = module.healthcheck.health_check_id
}

output "rds_primary" {
  value = module.rds.primary_id
}

output "kinesis_stream" {
  value = module.kinesis.stream_name
}
