

import json, yaml

with open("docs/openapi.json", "r") as f:
    data = json.load(f)

with open("docs/openapi.yaml", "w") as f:
    yaml.dump(data, f, sort_keys=False, allow_unicode=True)
