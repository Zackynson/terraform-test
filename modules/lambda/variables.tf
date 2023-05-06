# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

# Input variable definitions

# stage and region variables
variable "aws_region" {}

# api resources info
variable "rest_api_execution_arn" {}
variable "rest_api_id" {}
variable "api_gateway_resource_id" {}
variable "api_gateway_resource_path" {}
variable "api_gateway_resource_http_method" {}

# lambda role and name
variable "iam_role_for_lambda_arn" {}
variable "lambda_function_name" {}

# source code 
variable "output_path" {}
variable "source_file" {}
