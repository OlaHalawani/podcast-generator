# Use a stable Ubuntu version
FROM ubuntu:20.04

# Set non-interactive mode for apt-get to avoid prompts
ENV DEBIAN_FRONTEND=noninteractive

# Update package list and install required packages
RUN apt-get update && apt-get install -y \
    python3.10 \
    python3-pip \
    git \
    python3-dev \
    libyaml-dev \
    build-essential \
    curl

# Upgrade pip manually by downloading the latest version
RUN curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py && \
    python3 get-pip.py && \
    rm get-pip.py

# Install PyYAML using pip3
RUN pip3 install --no-cache-dir PyYAML

# Copy the Python script into the container
COPY feed.py /usr/bin/feed.py

# Copy the entrypoint script into the container
COPY entrypoint.sh /entrypoint.sh

# Set the entrypoint to the provided script
ENTRYPOINT ["/entrypoint.sh"]
