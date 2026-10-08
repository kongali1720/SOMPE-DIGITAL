# SOMPE-DIGITAL Database

Database foundation for:

- WAJO ID
- Business Directory
- Merchant Profiles
- Product Catalog
- Business Verification

## Core entities

```text
users
  │
  └── businesses
        ├── business_profiles
        ├── business_categories ── categories
        ├── products
        └── verification_requests
Primary database target: PostgreSQL.
