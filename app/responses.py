from pydantic import BaseModel


class JsonResponse(BaseModel):
    status_code: int
    headers: dict
    body: dict
