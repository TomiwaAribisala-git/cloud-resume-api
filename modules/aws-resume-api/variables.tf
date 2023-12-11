variable table_name {
    description = "The name of the DynamoDB Table"
    type = string
}

variable hash_key {
    description = "The partition key of the DynamoDB Table"
    type = string
}

variable function_name {
    description = "The name of the Lambda function"
    type = string
}

variable api_name {
    description = "The name of the API Gateway"
    type = string
}

variable stage_name {
    description = "The name of the deployed API stage"
    type = string
}

variable myregion {
    type = string
}

variable accountId {
    type = string
}