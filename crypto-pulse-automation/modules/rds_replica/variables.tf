variable "db_name" {
  description = "Identifier name of the primary RDS database"
  type        = string
}

variable "db_password" {
  description = "Password for the RDS master user"
  type        = string
  sensitive   = true
}

variable "replica_zone" {
  description = "Availability zone for the read replica"
  type        = string
}

variable "subnet_ids" {
  description = "List of subnet IDs for the DB subnet group"
  type        = list(string)
}
