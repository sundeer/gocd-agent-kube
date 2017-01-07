FROM gocd/gocd-agent

# Install Docker
RUN curl -fsSL https://get.docker.com/ | sh

# Install kubectl
RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl && \
    chmod +x ./kubectl && \
    mv ./kubectl /usr/local/bin/kubectl && \
    mkdir /kube
COPY kube/config /kube/config

RUN usermod -aG docker go
