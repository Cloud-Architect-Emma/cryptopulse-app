variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
}

variable "aws_profile" {
  description = "AWS CLI profile to use"
  type        = string
}

variable "bucket_name" {
  description = "Name of the S3 bucket"
  type        = string
}

variable "zone_id" {
  description = "Route53 hosted zone ID (leave empty if none)"
  type        = string
  default     = ""
}

variable "domain_name" {
  description = "Domain name for health check (leave empty if none)"
  type        = string
  default     = ""
}

variable "cloudfront_zone_id" {
  description = "AWS global CloudFront zone ID"
  type        = string
  default     = "Z2FDTNDATAQYW2"
}

variable "topic_name" {
  description = "Name of the SNS topic"
  type        = string
}

variable "alert_email" {
  description = "Email address to subscribe to SNS alerts"
  type        = string
}

variable "db_name" {
  description = "Identifier name of the primary RDS database"
  type        = string
}


variable "replica_zone" {
  description = "Availability zone for RDS replica"
  type        = string
}

variable "stream_name" {
  description = "Name of the Kinesis stream"
  type        = string
}

variable "db_password" {
  description = "Password for the RDS master user"
  type        = string
  sensitive   = true
}
