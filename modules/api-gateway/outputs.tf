output "execution_arn" {
  description = "Api gateway execution arn"
  value       = aws_api_gateway_rest_api.api.execution_arn
}

output "rest_api_id" {
  description = "Api gateway id"
  value       = aws_api_gateway_rest_api.api.id
}

output "root_resource_id" {
  description = "Id from the / path resource"
  value       = aws_api_gateway_rest_api.api.root_resource_id
}

output "resource_teste_id" {
  description = "Id from the /teste path resource"
  value       = aws_api_gateway_resource.resource_teste.id
}

output "resource_teste_path" {
  description = "/teste resource path-part"
  value       = aws_api_gateway_resource.resource_teste.path
}
