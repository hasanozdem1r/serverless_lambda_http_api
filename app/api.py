from typing import Dict, Any

import json

from app.database import get_connection_pool
from app.encoder import serialize_query


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

    return {"statusCode": 200, "body": json.dumps(serialized_result)}
