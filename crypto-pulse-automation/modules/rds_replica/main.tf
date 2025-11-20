# Subnet group for RDS
resource "aws_db_subnet_group" "default" {
  name       = "cryptopulse-db-subnet-group"
  subnet_ids = var.subnet_ids

  tags = {
    Name = "cryptopulse-db-subnet-group"
  }
}

# Primary RDS instance
resource "aws_db_instance" "primary" {
  identifier             = var.db_name
  engine                 = "postgres"
  instance_class         = "db.t3.micro"
  allocated_storage      = 20
  username               = "cryptopulse_admin"
  password               = var.db_password
  db_subnet_group_name   = aws_db_subnet_group.default.name
  skip_final_snapshot    = true

  # ✅ Enable backups
  backup_retention_period = 7   # keep backups for 7 days
  backup_window           = "03:00-04:00"  # optional, set a preferred backup time
}

# Read replica in another AZ
resource "aws_db_instance" "replica" {
  replicate_source_db  = aws_db_instance.primary.arn   # ✅ must use ARN
  instance_class       = "db.t3.micro"
  availability_zone    = var.replica_zone
  db_subnet_group_name = aws_db_subnet_group.default.name
  skip_final_snapshot  = true

depends_on = [aws_db_instance.primary]   # <-- ensures primary is ready
}

# Outputs
output "primary_id" {
  description = "ID of the primary RDS instance"
  value       = aws_db_instance.primary.id
}

output "replica_id" {
  description = "ID of the replica RDS instance"
  value       = aws_db_instance.replica.id
}

output "primary_endpoint" {
  description = "Connection endpoint of the primary RDS instance"
  value       = aws_db_instance.primary.endpoint
  sensitive   = true
}

output "replica_endpoint" {
  description = "Connection endpoint of the replica RDS instance"
  value       = aws_db_instance.replica.endpoint
  sensitive   = true
}
