# Use a lightweight base image
FROM debian:stable-slim

# Set maintainer label (optional)
LABEL maintainer="noah@kasbench.org"

# Environment variable to ensure utilities like psql and mongosh behave well
ENV TERM=xterm

# Install dependencies and debug tools
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    bash \
    coreutils \
    procps \
    curl \
    net-tools \
    iproute2 \
    dnsutils \
    tcpdump \
    nmap \
    postgresql-client \
    redis-tools \
    gnupg \
    ca-certificates \
    openjdk-21-jre-headless \
    wget && \
    # Add MongoDB official repo for mongosh
    curl -fsSL https://pgp.mongodb.com/server-6.0.asc | gpg --dearmor -o /usr/share/keyrings/mongodb-server-6.0.gpg && \
    echo "deb [ arch=amd64,arm64 signed-by=/usr/share/keyrings/mongodb-server-6.0.gpg ] https://repo.mongodb.org/apt/debian bookworm/mongodb-org/6.0 main" > /etc/apt/sources.list.d/mongodb-org-6.0.list && \
    apt-get update && \
    apt-get install -y --no-install-recommends mongodb-mongosh && \
    # Install Kafka client tools
    wget -O /tmp/kafka.tgz "https://archive.apache.org/dist/kafka/2.8.2/kafka_2.13-2.8.2.tgz" && \
    tar -xzf /tmp/kafka.tgz -C /opt && \
    mv /opt/kafka_2.13-2.8.2 /opt/kafka && \
    rm /tmp/kafka.tgz && \
    # Add Kafka bin directory to PATH
    echo 'export PATH="/opt/kafka/bin:$PATH"' >> /etc/bash.bashrc && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Default command when the container starts (optional, can be overridden)
# Here, we start a bash shell.
CMD ["/bin/bash"]
