#!/bin/bash

set -euo pipefail

cd $KOKORO_ARTIFACTS_DIR/git/cronk

pip install -U \
    keyring \
    twine \
    setuptools \
    wheel > /dev/null

pip install -U \
    keyrings.google-artifactregistry-auth > /dev/null

python3 -m build --wheel

twine upload \
    --repository-url https://us-central1-python.pkg.dev/oss-exit-gate-dev/cronk--testpypi \
    --verbose \
    dist/*
