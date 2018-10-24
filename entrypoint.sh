#!/usr/bin/env bash

set -euo pipefail

if [ -v GCLOUD_SERVICE_KEY ]; then
    gcp-login
fi

helm-tls-setup

exec "$@"
