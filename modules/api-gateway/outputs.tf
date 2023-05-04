output "execution_arn" {
  value = aws_api_gateway_rest_api.api.execution_arn
}

output "rest_api_id" {
  value = aws_api_gateway_rest_api.api.id
}

output "root_resource_id" {
  value = aws_api_gateway_rest_api.api.root_resource_id
}
