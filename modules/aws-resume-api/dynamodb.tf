resource "aws_dynamodb_table" "resume_table" {
  name           = var.table_name
  billing_mode   = "PROVISIONED"
  read_capacity  = 10
  write_capacity = 10
  hash_key       = var.hash_key

  attribute {
    name = "resume_data"
    type = "S"
  }
}

resource "aws_dynamodb_table_item" "tomiwa_aribisala_resume" {
  table_name = aws_dynamodb_table.resume_table.name
  hash_key   = aws_dynamodb_table.resume_table.hash_key
  item = jsonencode(
    {
    "resume_data": "tomiwa_aribisala_resume",
    "basics": {
      "location": {
      "address": "Henry Ojoghor Crescent",
      "city": "Lagos",
      "countryCode": "NG",
      "postalCode": "102574",
      "region": "Lekki"
      },
      "name": "Tomiwa Aribisala",
      "phone": "+2349037402028",
      "summary": "A summary of Tomiwa Aribisala Resume",
      "url": "https://github.com/TomiwaAribisala-git"
    },
    "projects": {
      "description": "Cloud Native Microservice Helm Charts",
      "endDate": "2023-12-20",
      "name": "Helm Charts",
      "startDate": "2023-12-01",
      "url": "https://github.com/TomiwaAribisala-git/microservices_helm_charts"
    },
    "skills": {
      "keywords": [
      "Golang",
      "Kernel",
      "Distributed Systems"
      ],
      "label": "Site Reliability Engineer",
      "level": "Intermediate"
    }
  }
)
}