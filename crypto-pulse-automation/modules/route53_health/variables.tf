variable "domain_name" {
  description = "Domain name to check health (leave empty if no domain)"
  type        = string
  default     = ""
}

variable "fqdn" {
  description = "Fully qualified domain name to check"
  type        = string
}
