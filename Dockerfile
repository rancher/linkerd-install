FROM ubuntu:18.04
ENV LINKERD_VERSION stable-2.6.1
ENV KUBECTL_VERSION v1.15.0
RUN apt update && apt install -y curl && curl -sL https://storage.googleapis.com/kubernetes-release/release/${KUBECTL_VERSION}/bin/linux/amd64/kubectl > /usr/local/bin/kubectl && curl -sL https://github.com/linkerd/linkerd2/releases/download/${LINKERD_VERSION}/linkerd2-cli-${LINKERD_VERSION}-linux > /usr/local/bin/linkerd &&  chmod +x /usr/local/bin/kubectl /usr/local/bin/linkerd
COPY ./linkerd-install.sh /usr/bin/linkerd-install.sh
RUN ["chmod", "+x", "/usr/bin/linkerd-install.sh"]
CMD ["sh", "-c", "/usr/bin/linkerd-install.sh"]
