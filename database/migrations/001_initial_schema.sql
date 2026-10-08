CREATE EXTENSION IF NOT EXISTS pgcrypto;

CREATE TABLE IF NOT EXISTS users (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    email VARCHAR(255) UNIQUE NOT NULL,
    password_hash TEXT NOT NULL,
    full_name VARCHAR(150) NOT NULL,
    phone VARCHAR(30),
    is_active BOOLEAN NOT NULL DEFAULT TRUE,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS categories (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name VARCHAR(100) UNIQUE NOT NULL,
    slug VARCHAR(120) UNIQUE NOT NULL,
    description TEXT,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS businesses (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    owner_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    name VARCHAR(200) NOT NULL,
    slug VARCHAR(220) UNIQUE NOT NULL,
    description TEXT,
    business_type VARCHAR(100),
    address TEXT,
    village VARCHAR(120),
    district VARCHAR(120),
    regency VARCHAR(120) DEFAULT 'Wajo',
    province VARCHAR(120) DEFAULT 'Sulawesi Selatan',
    country VARCHAR(120) DEFAULT 'Indonesia',
    postal_code VARCHAR(20),
    latitude NUMERIC(10,7),
    longitude NUMERIC(10,7),
    phone VARCHAR(30),
    email VARCHAR(255),
    website VARCHAR(255),
    is_active BOOLEAN NOT NULL DEFAULT TRUE,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS business_profiles (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    business_id UUID UNIQUE NOT NULL REFERENCES businesses(id) ON DELETE CASCADE,
    legal_name VARCHAR(255),
    nib VARCHAR(100),
    npwp VARCHAR(100),
    founded_year INTEGER,
    employee_count INTEGER,
    logo_url TEXT,
    cover_url TEXT,
    verified BOOLEAN NOT NULL DEFAULT FALSE,
    verification_level VARCHAR(30) NOT NULL DEFAULT 'unverified',
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS business_categories (
    business_id UUID NOT NULL REFERENCES businesses(id) ON DELETE CASCADE,
    category_id UUID NOT NULL REFERENCES categories(id) ON DELETE CASCADE,
    PRIMARY KEY (business_id, category_id)
);

CREATE TABLE IF NOT EXISTS products (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    business_id UUID NOT NULL REFERENCES businesses(id) ON DELETE CASCADE,
    name VARCHAR(200) NOT NULL,
    slug VARCHAR(220) NOT NULL,
    description TEXT,
    sku VARCHAR(100),
    price NUMERIC(18,2),
    currency CHAR(3) NOT NULL DEFAULT 'IDR',
    stock_quantity INTEGER NOT NULL DEFAULT 0,
    is_active BOOLEAN NOT NULL DEFAULT TRUE,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    UNIQUE (business_id, slug)
);

CREATE TABLE IF NOT EXISTS verification_requests (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    business_id UUID NOT NULL REFERENCES businesses(id) ON DELETE CASCADE,
    verification_type VARCHAR(50) NOT NULL DEFAULT 'business',
    status VARCHAR(30) NOT NULL DEFAULT 'pending',
    submitted_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    reviewed_at TIMESTAMPTZ,
    reviewer_id UUID REFERENCES users(id) ON DELETE SET NULL,
    notes TEXT
);

CREATE INDEX IF NOT EXISTS idx_businesses_owner
    ON businesses(owner_id);

CREATE INDEX IF NOT EXISTS idx_businesses_regency
    ON businesses(regency);

CREATE INDEX IF NOT EXISTS idx_businesses_district
    ON businesses(district);

CREATE INDEX IF NOT EXISTS idx_businesses_active
    ON businesses(is_active);

CREATE INDEX IF NOT EXISTS idx_products_business
    ON products(business_id);

CREATE INDEX IF NOT EXISTS idx_verification_business
    ON verification_requests(business_id);
