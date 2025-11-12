

# convertir_openapi.py
import json, yaml

# Abrir JSON que descargaste
with open("docs/openapi.json", "r") as f:
    data = json.load(f)

# Guardar como YAML en docs/
with open("docs/openapi.yaml", "w") as f:
    yaml.dump(data, f, sort_keys=False, allow_unicode=True)
