resource "aws_api_gateway_rest_api" "ResumeApi" {
  name = var.api_name
}

resource "aws_api_gateway_resource" "resume_data" {
  path_part   = "resume_data"
  parent_id   = aws_api_gateway_rest_api.ResumeApi.root_resource_id
  rest_api_id = aws_api_gateway_rest_api.ResumeApi.id
}

resource "aws_api_gateway_method" "get_method" {
  authorization = "NONE"
  http_method   = "GET"
  resource_id   = aws_api_gateway_resource.resume_data.id
  rest_api_id   = aws_api_gateway_rest_api.ResumeApi.id
}

resource "aws_api_gateway_integration" "integration" {
  rest_api_id             = aws_api_gateway_rest_api.ResumeApi.id
  resource_id             = aws_api_gateway_resource.resume_data.id
  http_method             = aws_api_gateway_method.get_method.http_method
  type                    = "AWS_PROXY"
  uri                     = aws_lambda_function.resumeapi_function.invoke_arn
}

resource "aws_api_gateway_deployment" "deployment" {
  rest_api_id = aws_api_gateway_rest_api.ResumeApi.id

  triggers = {
    # NOTE: The configuration below will satisfy ordering considerations,
    #       but not pick up all future REST API changes. More advanced patterns
    #       are possible, such as using the filesha1() function against the
    #       Terraform configuration file(s) or removing the .id references to
    #       calculate a hash against whole resources. Be aware that using whole
    #       resources will show a difference after the initial implementation.
    #       It will stabilize to only change when resources change afterwards.
    redeployment = sha1(jsonencode([
      aws_api_gateway_resource.resume_data.id,
      aws_api_gateway_method.get_method.id,
      aws_api_gateway_integration.integration.id,
    ]))
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_api_gateway_stage" "resumeApi" {
  stage_name    = var.stage_name
  deployment_id = aws_api_gateway_deployment.deployment.id
  rest_api_id   = aws_api_gateway_rest_api.ResumeApi.id
}