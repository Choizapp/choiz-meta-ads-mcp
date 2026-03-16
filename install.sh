#!/bin/bash
set -e

echo "Instalando choiz-meta-ads-mcp..."
npm install
npm run build

INSTALL_DIR="$(pwd)"

echo ""
echo "Listo. Actualizá tu claude_desktop_config.json con:"
echo ""
echo "  \"meta-ads\": {"
echo "    \"command\": \"node\","
echo "    \"args\": [\"${INSTALL_DIR}/build/index.js\"],"
echo "    \"env\": {"
echo "      \"META_ACCESS_TOKEN\": \"TU_TOKEN_ACÁ\""
echo "    }"
echo "  }"
echo ""
echo "Config en Mac: ~/Library/Application Support/Claude/claude_desktop_config.json"
