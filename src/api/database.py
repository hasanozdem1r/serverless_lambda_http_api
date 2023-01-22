from psycopg2.pool import ThreadedConnectionPool

from api.constants import DB_HOST, DB_NAME, DB_PASSWORD, DB_PORT, DB_USER


def get_connection_pool(db_host: str = DB_HOST,
                        db_port: int = DB_PORT,
                        db_user: str = DB_USER,
                        db_password: str = DB_PASSWORD,
                        db_name: str = DB_NAME):
    """
    Creating new PostgreSQL connections can be an expensive operation
    Args:
        db_host (str, optional):  Defaults to DB_HOST.
        db_port (int, optional):  Defaults to DB_PORT.
        db_user (str, optional): Defaults to DB_USER.
        db_password (str, optional): Defaults to DB_PASSWORD.
        db_name (str, optional): Defaults to DB_NAME.

    Returns:
        _type_: Threaded Connection
    """
    return ThreadedConnectionPool(minconn=5,
                                  maxconn=10,
                                  host=db_host,
                                  port=db_port,
                                  user=db_user,
                                  password=db_password,
                                  dbname=db_name)
