@echo off
echo Instalando choiz-meta-ads-mcp...
call npm install
call npm run build

echo.
echo Listo. Actualizá tu claude_desktop_config.json con:
echo.
echo   "meta-ads": {
echo     "command": "node",
echo     "args": ["%CD%\build\index.js"],
echo     "env": {
echo       "META_ACCESS_TOKEN": "TU_TOKEN_ACA"
echo     }
echo   }
echo.
echo Config en Windows: %%APPDATA%%\Claude\claude_desktop_config.json
