variable "lambda_role_arn" {
  description = "IAM role ARN for Lambda remediation function"
  type        = string
}

variable "db_name" {
  description = "Name of the RDS database"
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
