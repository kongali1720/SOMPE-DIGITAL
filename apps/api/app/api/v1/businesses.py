from fastapi import APIRouter
router = APIRouter(prefix="/businesses", tags=["Businesses"])
@router.get("/")
def list_businesses():
    return {
        "items": [],
        "message": "Business Directory foundation is ready.",
    }
@router.get("/{business_id}")
def get_business(business_id: str):
    return {
        "id": business_id,
        "message": "Business endpoint foundation.",
    }
