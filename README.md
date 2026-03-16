# choiz-meta-ads-mcp

Fork privado de [meta-ads-mcp](https://github.com/brijr/meta-ads-mcp) con soporte corregido para breakdowns demográficos (age, gender, placement y más).

## ¿Qué arregla este fork?

Cuando se consultan métricas con breakdown por edad y género, el paquete original descarta esas etiquetas en `get_insights`. Este fork las preserva, permitiendo análisis demográfico real desde Claude Desktop.

**Campos preservados:** `age`, `gender`, `placement`, `device_platform`, `publisher_platform`, `platform_position`, `impression_device`, `region`, `country`, `dma`, `product_id` y variantes horarias.

---

## Instalación

### 1. Clonar el repo

```bash
git clone https://github.com/abruzzini/choiz-meta-ads-mcp.git
cd choiz-meta-ads-mcp
```

### 2. Instalar y compilar

**Mac/Linux:**
```bash
chmod +x install.sh && ./install.sh
```

**Windows (PowerShell o CMD):**
```bat
install.bat
```

O manualmente:
```bash
npm install
npm run build
```

### 3. Actualizar claude_desktop_config.json

Reemplazar la entrada `meta-ads` existente.

**Mac** — config en `~/Library/Application Support/Claude/claude_desktop_config.json`:

```json
"meta-ads": {
  "command": "node",
  "args": ["/Users/TU_USUARIO/choiz-meta-ads-mcp/build/index.js"],
  "env": {
    "META_ACCESS_TOKEN": "TU_TOKEN_PERSONAL"
  }
}
```

**Windows** — config en `%APPDATA%\Claude\claude_desktop_config.json`:

```json
"meta-ads": {
  "command": "node",
  "args": ["C:\\Users\\TU_USUARIO\\choiz-meta-ads-mcp\\build\\index.js"],
  "env": {
    "META_ACCESS_TOKEN": "TU_TOKEN_PERSONAL"
  }
}
```

> Reemplazá `TU_USUARIO` con tu nombre de usuario del sistema.

### 4. Reiniciar Claude Desktop

Cerrar y volver a abrir Claude Desktop. Listo.

---

## Token de Meta Ads

Cada usuario necesita su propio `META_ACCESS_TOKEN`.
Pedíselo a Santi si no lo tenés.

---

## Verificación

Probá esta consulta en Claude:

```
get_insights con object_id de una campaña, level: "campaign",
breakdowns: ["age", "gender"], fields: ["spend", "impressions", "clicks"]
```

Cada fila debe mostrar `age` y `gender`:
```json
{ "age": "25-34", "gender": "female", "impressions": "1234", "spend": "5.67" }
{ "age": "25-34", "gender": "male",   "impressions": "987",  "spend": "4.12" }
```

---

## Updates

Para actualizar a futuras versiones del fix:
```bash
cd choiz-meta-ads-mcp
git pull
npm install
npm run build
```

No hace falta tocar `claude_desktop_config.json`.
