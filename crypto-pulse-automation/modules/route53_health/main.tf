# modules/route53_health/main.tf

resource "aws_route53_health_check" "site_health" {
  fqdn              = var.fqdn
  type              = "HTTP"
  port              = 80
  resource_path     = "/"
  request_interval  = 30
  failure_threshold = 3

  # ✅ Must include at least one region
  regions = [
    "us-east-1",
    "us-west-1",
    "eu-west-1"
  ]

  tags = {
    Name = "cryptopulse-site-health"
  }
}

output "health_check_id" {
  description = "ID of the Route53 health check"
  value       = aws_route53_health_check.site_health.id
}
