## Cloud Resume API
This repository is a solution of the [AWS Resume API Challenge](https://github.com/rishabkumar7/aws-resume-api), an API that serves resume data in JSON format hosted in AWS.

## Services Used
- DynamoDB Table: Stores the resume in json format, not DynamoDB JSON format
- API Gateway + Lambda Function: Fetches and displays the resume data in json format from the DynamoDB Table
- API URL: https://b741ozvtoc.execute-api.eu-north-1.amazonaws.com/resumeApi/resume_data
- Github Actions: Workflow to run Terraform when triggered
## Extras 
- [Terraform Standard Module Structure](https://developer.hashicorp.com/terraform/language/modules/develop/structure)
- [JSON Resume Format](https://jsonresume.org/schema/)