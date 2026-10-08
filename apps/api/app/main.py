from fastapi import FastAPI
from app.api.v1.router import api_router
from app.core.config import settings
app = FastAPI(
    title=settings.app_name,
    version=settings.app_version,
    description=(
        "Digital economic infrastructure for Wajo — "
        "WAJO ID, Business Directory and SOMPE-DIGITAL ecosystem."
    ),
)
app.include_router(
    api_router,
    prefix="/api/v1",
)
@app.get("/")
def root():
    return {
        "name": "SOMPE-DIGITAL",
        "service": "WAJO DIGITAL API",
        "version": settings.app_version,
        "status": "online",
    }
