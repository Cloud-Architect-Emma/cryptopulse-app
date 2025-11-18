output "lambda_role_arn" {
  description = "ARN of the IAM role used by the remediation Lambda"
  value       = aws_iam_role.lambda_role.arn
}

output "lambda_function_name" {
  description = "Name of the remediation Lambda function"
  value       = aws_lambda_function.remediation.function_name
}
