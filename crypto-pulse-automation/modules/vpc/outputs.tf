output "public_a_id" {
  description = "ID of the public subnet in AZ a"
  value       = aws_subnet.public_a.id
}

output "public_b_id" {
  description = "ID of the public subnet in AZ b"
  value       = aws_subnet.public_b.id
}
