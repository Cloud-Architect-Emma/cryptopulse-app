def lambda_handler(event, context):
    print("Remediation Lambda triggered")
    return {
        "statusCode": 200,
        "body": "Lambda executed successfully"
    }
