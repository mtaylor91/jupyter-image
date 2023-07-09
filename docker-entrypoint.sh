#!/bin/bash

set -e

/opt/venv/bin/jupyter-lab --no-browser --ip 0.0.0.0 --port 8080 \
  --IdentityProvider.token='' --ServerApp.password=''
