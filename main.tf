
module "api-gateway" {
  source     = "./modules/api-gateway"
  aws_region = var.aws_region
}

module "iam" {
  source = "./modules/iam"
}

module "teste-lambda" {
  source                           = "./modules/lambda"
  aws_region                       = var.aws_region
  rest_api_execution_arn           = module.api-gateway.execution_arn
  rest_api_id                      = module.api-gateway.rest_api_id
  lambda_function_name             = "new-name"
  output_path                      = "${path.module}/dist/hello-world.zip"
  source_file                      = "${path.module}/src/hello-world/index.js"
  api_gateway_resource_http_method = "POST"
  iam_role_for_lambda_arn          = module.iam.iam_role_for_lambda_arn
  api_gateway_resource_id          = module.api-gateway.resource_teste_id
  api_gateway_resource_path        = module.api-gateway.resource_teste_path
}

module "teste-lambda-2" {
  source                           = "./modules/lambda"
  aws_region                       = var.aws_region
  rest_api_execution_arn           = module.api-gateway.execution_arn
  rest_api_id                      = module.api-gateway.rest_api_id
  lambda_function_name             = "new-name-2"
  output_path                      = "${path.module}/dist/hello-world-2.zip"
  source_file                      = "${path.module}/src/hello-world-2/index.js"
  api_gateway_resource_http_method = "GET"
  iam_role_for_lambda_arn          = module.iam.iam_role_for_lambda_arn
  api_gateway_resource_id          = module.api-gateway.resource_teste_id
  api_gateway_resource_path        = module.api-gateway.resource_teste_path
}
