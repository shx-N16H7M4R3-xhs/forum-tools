#!/usr/bin/env bash

echo "[*] Cleaning up old logs and temp files"

rm -rf /tmp/forum_*
find /var/log/forum -type f -mtime +7 -delete

echo "[✓] Cleanup complete"
