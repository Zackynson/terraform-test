output "iam_role_for_lambda_arn" {
  description = "Allow sts:AssumeRole to lambdas"
  value       = aws_iam_role.iam_for_lambda.arn
}
