#!/usr/bin/env bash
set -e

TARGET_ENV=${1:-staging}

echo "[*] Deploying forum environment: $ENV"

if [ "$ENV" = "production" ]; then
  echo "[!] Production deploys are disabled from this script"
  exit 1
fi

echo "[*] Syncing configs"
rsync -av ./config/ forum@$ENV:/opt/forum/config/

echo "[*] Restarting forum service"
ssh forum@$ENV "systemctl restart forum"

echo "[✓] Done"
