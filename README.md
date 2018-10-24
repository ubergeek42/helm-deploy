# helm-deploy
A docker image for deploying to Kubernetes with Helm.

Installed commands:

- `helm`
- `kubectl`
- `gcloud`
- `git`
- `bash`
- `jq`

## Logging Into Google Cloud
To log into Google Cloud, set `GCLOUD_SERVICE_KEY` to be a base64-encoded
version of a json credentials file. If running this Dockerfile directly, that is
the only necessary step; if using this Dockerfile without running its
entrypoint, you should run `gcp-login` to log in.

## Setting Up Helm TLS
To use TLS with Helm, set the following environment variables:

- `HELM_TLS_CERTFILE`: A base64-encoded version of the TLS client cert
- `HELM_TLS_CA_CERTFILE`: A base64-encoded version of the TLS CA cert (optional
  unless you're using TLS verification)
- `HELM_TLS_KEYFILE`: A base64-encoded of the TLS client key, either encrypted
  or plaintext (see below)

If you're not using the default `ENTRYPOINT`, run `bin/helm-tls-setup` before
running Helm.

### Encrypting the TLS Client Key
You can optionally use a version of the TLS client key that was encrypted using
Google Cloud KMS. To do so, set the following environment variables:

- `HELM_TLS_KEYFILE`: This should be a base64-encoded version of the TLS key
  ciphertext (encrypted with Cloud KMS)
- `HELM_TLS_KMS_PROJECT`: The GCP project for the KMS key
- `HELM_TLS_KMS_KEYRING`: The keyring for the KMS key
- `HELM_TLS_KMS_KEY`: The KMS key with which the TLS key was encrypted
