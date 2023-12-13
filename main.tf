terraform {
  cloud {
    organization = "tomiwa-terraform-bootcamp-2023"

    workspaces {
      name = "resumeapi-workspace"
    }
  }
}

module "aws-resume-api" {
  source = "./modules/aws-resume-api"
  table_name = var.table_name
  hash_key = var.hash_key
  function_name = var.function_name
  api_name = var.api_name
  stage_name = var.stage_name
  myregion = var.myregion
  accountId = var.accountId
}