from typing import Dict, Any

import json

from app.database import get_connection_pool
from app.encoder import serialize_query
from app.responses import JsonResponse


def read_report(event, context):
    report_id = event["pathParameters"]["report_id"]
    connection_pool = get_connection_pool()
    with connection_pool.getconn() as conn:
        with conn.cursor() as curs:
            curs.execute("SELECT * FROM items WHERE id = %s", (report_id,))
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
