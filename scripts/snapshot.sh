#!/usr/bin/env bash
set -e

VER=$1
if [[ "$VER" != "33" && "$VER" != "34" && "$VER" != "35" ]]; then
  echo "Uso: ./scripts/snapshot.sh [33|34|35]"
  exit 1
fi

DB_NAME="omp_${VER}"
TARGET_SQL="fixtures/sql/omp${VER}-seed.sql"
TARGET_CONFIG="fixtures/configs/config.omp${VER}.php"

mkdir -p fixtures/sql fixtures/configs

echo "Guardando snapshot de base de datos para OMP 3.${VER}..."
echo "USE ${DB_NAME};" > "$TARGET_SQL"
docker compose exec -T db mysqldump -u omp -pomp --no-tablespaces "$DB_NAME" >> "$TARGET_SQL"

echo "Guardando archivo config.inc.php..."
docker compose cp "omp${VER}:/var/www/html/config.inc.php" "$TARGET_CONFIG"

echo "Snapshot para OMP 3.${VER} generado con éxito."
