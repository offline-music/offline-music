#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "$0")" && pwd)"

curl -sS \
  -H "x-platform: android" \
  "https://music.vibeflowplayer.com/vibeflow-api/fapi/globalConfig" \
  | python3 -c 'import json,sys; print(json.dumps(json.load(sys.stdin), ensure_ascii=False, indent=2))' \
  > "${ROOT_DIR}/globalConfig.json"

curl -sS \
  -H "x-platform: android_debug" \
  "https://music.vibeflowplayer.com/test-vibeflow-api/fapi/globalConfig" \
  | python3 -c 'import json,sys; print(json.dumps(json.load(sys.stdin), ensure_ascii=False, indent=2))' \
  > "${ROOT_DIR}/globalConfig.debug.json"

echo "Updated:"
echo "  ${ROOT_DIR}/globalConfig.json"
echo "  ${ROOT_DIR}/globalConfig.debug.json"
