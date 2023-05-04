
module "api-gateway" {
  source     = "./modules/api-gateway"
  aws_region = var.aws_region
}

module "iam" {
  source = "./modules/iam"
}

module "teste-lambda" {
  source                             = "./modules/lambda"
  aws_region                         = var.aws_region
  rest_api_execution_arn             = module.api-gateway.execution_arn
  rest_api_id                        = module.api-gateway.rest_api_id
  rest_api_root_resource_id          = module.api-gateway.root_resource_id
  lambda_function_name               = "new-name"
  output_path                        = "${path.module}/dist/hello-world.zip"
  source_file                        = "${path.module}/hello-world/index.js"
  aws_api_gateway_resource_path_part = "teste"
  aws_api_gateway_method_http_method = "POST"
  iam_for_lambda_arn                 = module.iam.iam_for_lambda_arn
}

module "teste-lambda-2" {
  source                             = "./modules/lambda"
  aws_region                         = var.aws_region
  rest_api_execution_arn             = module.api-gateway.execution_arn
  rest_api_id                        = module.api-gateway.rest_api_id
  rest_api_root_resource_id          = module.api-gateway.root_resource_id
  lambda_function_name               = "new-name-2"
  output_path                        = "${path.module}/dist/hello-world.zip"
  source_file                        = "${path.module}/hello-world/index.js"
  aws_api_gateway_resource_path_part = "teste-2"
  aws_api_gateway_method_http_method = "GET"
  iam_for_lambda_arn                 = module.iam.iam_for_lambda_arn
}
