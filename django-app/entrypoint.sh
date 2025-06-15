#!/bin/sh
set -e

APP_PORT="${PORT:-8000}"
APP_TIMEOUT="${GUNICORN_TIMEOUT:-120}"


cd /app/

exec /opt/venv/bin/gunicorn \
  --worker-tmp-dir /dev/shm \
  --timeout "${APP_TIMEOUT}" \
  --bind "0.0.0.0:${APP_PORT}" \
  django_k8s.wsgi:application