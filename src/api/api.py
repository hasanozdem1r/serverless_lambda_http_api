import json

from src.api.database import get_connection_pool
from src.api.encoder import serialize_query
from src.api.responses import JsonResponse
from typing import Dict
from datetime import date


def read_report(event, context):
    report_id = event["pathParameters"]["report_id"]
    connection_pool = get_connection_pool()
    with connection_pool.getconn() as conn:
        with conn.cursor() as curs:
            curs.execute("SELECT * FROM serverless_schema.audit WHERE id = %s",
                         (report_id,))
            result = curs.fetchone()
            # Serializing JSON objects which is not serializable by default json code
            serialized_result = serialize_query(cursor=curs, result=result)
    connection_pool.putconn(conn)

    json_response = JsonResponse(status_code=200,
                                 headers={
                                     "Access-Control-Allow-Origin": "*",
                                     "Access-Control-Allow-Methods": "GET",
                                 },
                                 body=json.dumps(serialized_result))

    return {
        "statusCode": json_response.status_code,
        "Headers": json_response.headers,
        "body": json_response.body
    }
