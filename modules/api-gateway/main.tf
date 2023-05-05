resource "aws_api_gateway_rest_api" "api" {
  name = "terraform-http-api"
}


resource "aws_api_gateway_resource" "resource_teste" {
  rest_api_id = aws_api_gateway_rest_api.api.id
  parent_id   = aws_api_gateway_rest_api.api.root_resource_id
  path_part   = "teste"
}
