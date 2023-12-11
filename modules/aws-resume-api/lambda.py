import boto3
import json

table_name = 'Resume'
partition_key_name = 'resume_data'  # Update with your actual partition key name

def lambda_handler(event, context):
    dynamodb = boto3.resource('dynamodb')
    table = dynamodb.Table(table_name)

    # Specify the partition key value
    partition_key_value = 'tomiwa_aribisala_resume'

    try:
        # Get item from DynamoDB based on partition key
        response = table.get_item(
            Key={
                partition_key_name: partition_key_value
            }
        )

        # Check if the item exists
        if 'Item' in response:
            # Return the item data as JSON
            return {
                'body': json.dumps(response['Item'])
            }
        else:
            return {
                'body': json.dumps({'error': 'Item not found'})
            }

    except Exception as e:
        return {
            'statusCode': 500,
            'body': json.dumps({'error': str(e)})
        }