from fastapi import APIRouter
router = APIRouter(prefix="/users", tags=["Users"])
@router.get("/me")
def current_user():
    return {
        "authenticated": False,
        "message": "WAJO ID authentication will be implemented here.",
    }
