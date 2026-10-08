from fastapi import APIRouter
from app.api.v1 import businesses, categories, health, users
api_router = APIRouter()
api_router.include_router(health.router)
api_router.include_router(users.router)
api_router.include_router(businesses.router)
api_router.include_router(categories.router)
