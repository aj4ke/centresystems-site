#!/usr/bin/env bash

set -euo pipefail
cd "$(dirname "$0")"

WEB=${WEB:-/var/www/centre}
API=${API:-/opt/centre}
APPLY=/usr/local/sbin/centre-apply

echo "==> site -> $WEB"
rsync -rlt --delete --chmod=D755,F644 --itemize-changes site/ "$WEB/"

echo "==> api -> $API"
install -m 644 api/api.js "$API/api.js"
install -m 644 Caddyfile "$API/Caddyfile"   # staged; centre-apply installs it

echo "==> apply"
if [[ ${SKIP_APPLY:-} == 1 ]]; then
  echo "skipped (SKIP_APPLY=1)"
elif [[ $EUID -eq 0 ]]; then
  "$APPLY"
else
  sudo -n "$APPLY"
fi
