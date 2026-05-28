#!/usr/bin/with-contenv bashio

# ---------------------------------------------------------------------------
# Read user config via bashio (parsed from /data/options.json)
# ---------------------------------------------------------------------------
TZ=$(bashio::config 'timezone')
DB_HOST=$(bashio::config 'db_host')
DB_PORT=$(bashio::config 'db_port')
DB_NAME=$(bashio::config 'db_name')
DB_USER=$(bashio::config 'db_user')
DB_PASSWORD=$(bashio::config 'db_password')
SWAGGER=$(bashio::config 'swagger_enabled')

bashio::log.info "Starting Grimmory..."
bashio::log.info "Database: ${DB_USER}@${DB_HOST}:${DB_PORT}/${DB_NAME}"

# ---------------------------------------------------------------------------
# Set environment variables expected by Grimmory
# ---------------------------------------------------------------------------
export TZ="${TZ}"
export DATABASE_URL="jdbc:mariadb://${DB_HOST}:${DB_PORT}/${DB_NAME}?useUnicode=true&characterEncoding=utf8mb4"
export DATABASE_USERNAME="${DB_USER}"
export DATABASE_PASSWORD="${DB_PASSWORD}"
export SWAGGER_ENABLED="${SWAGGER}"
export DISK_TYPE="LOCAL"

# ---------------------------------------------------------------------------
# Ensure data directories exist
# ---------------------------------------------------------------------------
mkdir -p /media/grimmory/books
mkdir -p /share/grimmory/bookdrop

# ---------------------------------------------------------------------------
# Start Grimmory using its own entrypoint
# ---------------------------------------------------------------------------
bashio::log.info "Handing off to Grimmory..."
exec /usr/local/bin/entrypoint.sh java \
  --enable-native-access=ALL-UNNAMED \
  --enable-preview \
  -jar /app/app.jar
  