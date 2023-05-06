data "archive_file" "code_to_zip" {
  output_path = var.output_path
  source_file = var.source_file
  type        = "zip"
}


resource "aws_lambda_function" "lambda" {
  filename         = data.archive_file.code_to_zip.output_path
  function_name    = var.lambda_function_name
  role             = var.iam_role_for_lambda_arn
  handler          = "index.handler"
  runtime          = "nodejs16.x"
  timeout          = 30
  memory_size      = 128
  source_code_hash = data.archive_file.code_to_zip.output_base64sha256
}


resource "aws_lambda_permission" "permission_for_lambda" {
  statement_id  = "AllowApiGatewayToInvokeLambda"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.lambda.function_name
  principal     = "apigateway.amazonaws.com"
  source_arn    = "${var.rest_api_execution_arn}*/*"
}

resource "aws_api_gateway_method" "method" {
  rest_api_id   = var.rest_api_id
  resource_id   = var.api_gateway_resource_id
  http_method   = var.api_gateway_resource_http_method
  authorization = "NONE"
}


resource "aws_api_gateway_integration" "integration" {
  http_method             = aws_api_gateway_method.method.http_method
  rest_api_id             = var.rest_api_id
  resource_id             = var.api_gateway_resource_id
  integration_http_method = "POST"
  type                    = "AWS_PROXY"
  uri                     = aws_lambda_function.lambda.invoke_arn
}

# Lambda
resource "aws_lambda_permission" "apigw_lambda" {
  statement_id  = "AllowExecutionFromAPIGateway"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.lambda.function_name
  principal     = "apigateway.amazonaws.com"

  # More: http://docs.aws.amazon.com/apigateway/latest/developerguide/api-gateway-control-access-using-iam-policies-to-invoke-api.html
  source_arn = "arn:aws:execute-api:us-east-1:566163553601:${var.rest_api_id}/*/${aws_api_gateway_method.method.http_method}${var.api_gateway_resource_path}"
}
