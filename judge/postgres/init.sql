-- CodeQuest PostgreSQL initialization
-- This runs once when the container is first created.
-- Django migrations handle the actual schema.

-- Ensure the database and user exist (already created by env vars, but safe to repeat)
SELECT 'CREATE DATABASE codequest'
WHERE NOT EXISTS (SELECT FROM pg_database WHERE datname = 'codequest')\gexec

-- Enable useful extensions
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
CREATE EXTENSION IF NOT EXISTS "pg_trgm";  -- For fast LIKE / full-text search on problem titles