FROM alpine:3.8
RUN apk add --no-cache python git && \
    mkdir -p /tmp/install && cd /tmp/install && \
    wget https://storage.googleapis.com/kubernetes-release/release/v1.10.6/bin/linux/amd64/kubectl && \
    mv kubectl /usr/local/bin && \
    chmod +x /usr/local/bin/kubectl && \
    wget https://storage.googleapis.com/kubernetes-helm/helm-v2.11.0-linux-amd64.tar.gz && \
    tar xzf helm*.tar.gz && \
    cp linux*/helm /usr/local/bin && \
    wget https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-215.0.0-linux-x86_64.tar.gz && \
    tar xzf google-cloud-sdk*.tar.gz -C /usr/local && \
    rm -rf /tmp/install
ENV PATH="/usr/local/google-cloud-sdk/bin:$PATH"
