from pydantic import BaseModel


class JsonResponse(BaseModel):
    """
    Rest Api Response is structured
    """
    status_code: int
    headers: dict = {"Content-Type": "application/json"}
    body: str
