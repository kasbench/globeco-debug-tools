# Use a lightweight base image
FROM alpine:latest

# Set maintainer label (optional)
LABEL maintainer="yourname@example.com"

# Environment variable to ensure utilities like psql and mongosh behave well
ENV TERM=xterm

# Update package list and install common debugging tools
# - bash: A more feature-rich shell than sh (default in Alpine)
# - coreutils: Provides basic file, shell and text manipulation utilities (e.g., env, printenv)
# - procps: For process utilities like ps, top
# - curl: For making HTTP requests to other containers/services
# - net-tools: Includes ifconfig, netstat, route (though iproute2 is more modern)
# - iproute2: Modern networking tools (ip addr, ip route, ss)
# - dnsutils: For DNS lookup tools like nslookup and dig (often part of bind-tools or similar package name depending on distro)
# - tcpdump: For network packet analysis
# - nmap: For network exploration and security auditing
# - postgresql-client: For connecting to PostgreSQL databases (psql)
# - mongo-tools: For connecting to MongoDB (mongosh or older mongo shell) - may need a specific repository or different package name
# - redis: For redis-cli to connect to Redis

RUN apk update && \
    apk add --no-cache \
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
    mongodb-tools \
    redis

# Default command when the container starts (optional, can be overridden)
# Here, we start a bash shell.
CMD ["/bin/bash"]
