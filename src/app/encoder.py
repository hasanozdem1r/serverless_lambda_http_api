import json


def serialize_query(cursor, result):
    """
    JSON Serializer if file type is not convenient
    """
    if result is None:
        return None
    else:
        # Get column names from cursor description
        column_names = [desc[0] for desc in cursor.description]
        # Create a dictionary using column names as keys and values from result
        data = dict(zip(column_names, result))
        # Serialize the dictionary to a JSON string
        json_data = json.dumps(data)
        return json_data
