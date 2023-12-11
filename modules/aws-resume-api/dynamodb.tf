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
  item = <<ITEM
{
 "resume_data": {
  "S": "tomiwa_aribisala_resume"
 },
 "basics": {
  "M": {
   "location": {
    "M": {
     "address": {
      "S": "Henry Ojoghor Crescent"
     },
     "city": {
      "S": "Lagos"
     },
     "countryCode": {
      "S": "NG"
     },
     "postalCode": {
      "S": "102574"
     },
     "region": {
      "S": "Lekki"
     }
    }
   },
   "name": {
    "S": "Tomiwa Aribisala"
   },
   "phone": {
    "S": "+2349037402028"
   },
   "summary": {
    "S": "A summary of Tomiwa Aribisala Resume"
   },
   "url": {
    "S": "https://github.com/TomiwaAribisala-git"
   }
  }
 },
 "projects": {
  "M": {
   "description": {
    "S": "Cloud Native Microservice Helm Charts"
   },
   "endDate": {
    "S": "2023-12-20"
   },
   "name": {
    "S": "Helm Charts"
   },
   "startDate": {
    "S": "2023-12-01"
   },
   "url": {
    "S": "https://github.com/TomiwaAribisala-git/microservices_helm_charts"
   }
  }
 },
 "skills": {
  "M": {
   "keywords": {
    "L": [
     {
      "S": "Golang"
     },
     {
      "S": "Kernel"
     },
     {
      "S": "Distributed Systems"
     }
    ]
   },
   "label": {
    "S": "Site Reliability Engineer"
   },
   "level": {
    "S": "Intermediate"
   }
  }
 }
}
ITEM
}