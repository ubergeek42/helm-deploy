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
