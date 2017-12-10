FROM ubuntu:16.04

ARG NEO_CLI_VERSION=v2.4.1

RUN apt-get update && apt-get install -y \
    libleveldb-dev  \
    sqlite3         \
    libsqlite3-dev  \
    libunwind8-dev  \
    libicu-dev      \
    wget            \
    unzip

RUN mkdir -p /tmp/neo-cli && \
    wget -P /tmp/neo-cli https://github.com/neo-project/neo-cli/releases/download/${NEO_CLI_VERSION}/neo-cli-ubuntu.16.10-x64.zip && \
    unzip /tmp/neo-cli/neo-cli-ubuntu.16.10-x64.zip -d /opt && \
    rm -rf /tmp/neo-cli && \
    chmod +x /opt/neo-cli/neo-cli && \
    ln -fsn /opt/neo-cli/neo-cli /bin/neo