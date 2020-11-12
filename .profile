#!/bin/bash

function config {
python - <<END
import json, os;
vars = [key for key in os.environ.keys()]
filtered = { var: os.environ[var] for var in vars }
print(json.dumps(filtered))
END
}

OUTPUT=$(config)
CONFIG="function getFrontEndConfig() { return $OUTPUT; }"
echo $CONFIG > ./public/config.js
