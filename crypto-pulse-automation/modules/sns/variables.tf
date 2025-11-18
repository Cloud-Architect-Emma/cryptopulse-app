variable "topic_name" {
  description = "Name of the SNS topic"
  type        = string
  default     = "CryptoPulseAlerts"
}

variable "alert_email" {
  description = "Email address to receive alerts"
  type        = string
}
