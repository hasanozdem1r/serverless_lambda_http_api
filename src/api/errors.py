import json
from src.api.responses import JsonResponse


def resource_not_found(event, context):
    json_response = JsonResponse(status_code=200,
                                 headers={
                                     "Access-Control-Allow-Origin": "*",
                                     "Access-Control-Allow-Methods": "GET",
                                 },
                                 body="Resource is not found")

    return {
        "statusCode": json_response.status_code,
        "Headers": json_response.headers,
        "body": json_response.body
    }
