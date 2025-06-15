#!/bin/sh
APP_PORT=${PORT:-8000}
cd /app/
exec /opt/venv/bin/gunicorn --worker-tmp-dir /dev/shm django_k8s.wsgi:application --bind "0.0.0.0:${APP_PORT}" --workers 3 --timeout 120 --worker-tmp-dir /dev/shm
