FROM ubuntu:bionic

# Set metadata
LABEL maintainer="The Mimix Company <code@mimix.io>"
LABEL version="1.0.0"
LABEL description="Dockerfile for mkcmd"

# Set environment
ENV DEBIAN_FRONTEND=noninteractive

# Install the base packages
RUN apt-get update
RUN apt-get install -y software-properties-common build-essential curl rsync git jq dnsutils xsel

# Install doctl
RUN cd /tmp && curl -sL https://github.com/digitalocean/doctl/releases/download/v1.48.0/doctl-1.48.0-linux-amd64.tar.gz | tar -xvz
RUN mv /tmp/doctl /usr/local/bin

# Setup SSH
RUN mkdir -p /root/.ssh && chmod 0700 /root/.ssh && ssh-keyscan github.com > /root/.ssh/known_hosts

# Setup directories
RUN mkdir -p /opt/mkcmd

# Install the scripts
COPY ./mkcmd /opt/mkcmd/mkcmd
COPY ./docmd /opt/mkcmd/docmd
ADD resources /opt/mkcmd/resources
ADD bin /opt/mkcmd/bin

# Run bash
CMD [ "/bin/bash" ]
