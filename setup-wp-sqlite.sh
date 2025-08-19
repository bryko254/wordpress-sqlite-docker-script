#!/bin/bash
set -e

PROJECT_DIR="wordpress_sqlite"
CONTAINER_NAME="wp-sqlite"
PLUGIN_URL="https://downloads.wordpress.org/plugin/sqlite-database-integration.latest-stable.zip"
PLUGIN_ZIP="sqlite.zip"

echo "[1/7] Creating project directory..."
mkdir -p $PROJECT_DIR/wordpress

echo "[2/7] Writing docker-compose.yml..."
cat > $PROJECT_DIR/docker-compose.yml <<EOL
services:
  wordpress:
    image: wordpress:php8.2-apache
    container_name: $CONTAINER_NAME
    volumes:
      - ./wordpress:/var/www/html
    ports:
      - "8080:80"
    environment:
      WORDPRESS_DB_TYPE: sqlite
      WORDPRESS_DB_NAME: wordpress.db
EOL

echo "[3/7] Starting WordPress container..."
docker compose -f $PROJECT_DIR/docker-compose.yml up -d

echo "[4/7] Waiting for WordPress files to be initialized..."
for i in {1..30}; do
  if docker exec $CONTAINER_NAME test -f /var/www/html/wp-config-sample.php; then
    echo "WordPress files detected."
    break
  fi
  echo "Still waiting ($i/30)..."
  sleep 2
done

echo "[5/7] Downloading SQLite integration plugin..."
cd $PROJECT_DIR
curl -L $PLUGIN_URL -o $PLUGIN_ZIP
unzip -o $PLUGIN_ZIP -d wordpress/wp-content/plugins/
rm $PLUGIN_ZIP

echo "[6/7] Activating SQLite integration..."
cp wordpress/wp-content/plugins/sqlite-database-integration/db.copy \
   wordpress/wp-content/db.php

echo "[7/7] Setup complete!"
echo "Visit: http://localhost:8080"
