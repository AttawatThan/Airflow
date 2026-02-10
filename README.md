# Airflow

## Prerequisites

- Docker & Docker Compose installed
- At least 4GB RAM, 2 CPUs, 10GB disk space

## Quick Start

### 1. Create `.env` file

```bash
cp .env.example .env
```

Required environment variables:

```env
# Airflow UID (run: id -u)
AIRFLOW_UID=50000

# PostgreSQL
POSTGRES_USER=airflow
POSTGRES_PASSWORD=airflow
POSTGRES_DB=airflow

# Airflow Secrets
AIRFLOW__CORE__FERNET_KEY=<your-fernet-key>
AIRFLOW__API_AUTH__JWT_SECRET=<your-jwt-secret>

# Airflow Admin User
_AIRFLOW_WWW_USER_USERNAME=airflow
_AIRFLOW_WWW_USER_PASSWORD=airflow

# Email
AIRFLOW__EMAIL__FROM_EMAIL=donotreply@example.com
```

Generate Fernet key:

```bash
python -c "from cryptography.fernet import Fernet; print(Fernet.generate_key().decode())"
```

Generate JWT secret:

```bash
python -c "import secrets; print(secrets.token_hex(32))"
```

### 2. Build and Start

```bash
# Build and start all services
docker compose up -d --build
```

### 3. Access Airflow

Open [http://localhost:8080](http://localhost:8080) and login with credentials from `.env`.

## Common Commands

```bash
# Stop all services
docker compose down

# View logs
docker compose logs -f

# Restart services
docker compose restart

# Remove volumes (reset database)
docker compose down -v
```