#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "$0")" && pwd)"

format_json() {
  python3 -c 'import json,sys; print(json.dumps(json.load(sys.stdin), ensure_ascii=False, indent=2))'
}

curl -sS \
  -H "x-platform: android" \
  "https://music.vibeflowplayer.com/vibeflow-api/fapi/resources?type=musicHome" \
  | format_json \
  > "${ROOT_DIR}/musicHome.json"

echo "Updated:"
echo "  ${ROOT_DIR}/musicHome.json"
