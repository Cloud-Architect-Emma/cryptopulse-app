# IAM role for the remediation Lambda
resource "aws_iam_role" "lambda_role" {
  name = "remediation-lambda-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action    = "sts:AssumeRole"
        Effect    = "Allow"
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      }
    ]
  })
}

# Attach basic execution policy
resource "aws_iam_role_policy_attachment" "lambda_basic" {
  role       = aws_iam_role.lambda_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

# Package the Python file into a zip
data "archive_file" "lambda_zip" {
  type        = "zip"
  source_file = "${path.module}/index.py"   # make sure index.py exists here
  output_path = "${path.module}/lambda.zip"
}

# Lambda function itself
resource "aws_lambda_function" "remediation" {
  filename         = data.archive_file.lambda_zip.output_path
  function_name    = "remediation-lambda"
  role             = aws_iam_role.lambda_role.arn
  handler          = "index.lambda_handler"
  runtime          = "python3.9"

  source_code_hash = data.archive_file.lambda_zip.output_base64sha256
}
