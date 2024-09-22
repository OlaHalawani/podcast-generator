# Use the latest Ubuntu base image
FROM ubuntu:latest

# Update package list and install required packages
RUN apt-get update && apt-get install -y \
    python3.10 \
    python3-pip \
    git \
    python3-dev \
    libyaml-dev \
    build-essential

# Upgrade pip to the latest version to ensure compatibility
RUN pip3 install --upgrade pip

# Install PyYAML package using pip3
RUN pip3 install PyYAML

# Copy the Python script into the container
COPY feed.py /usr/bin/feed.py

# Copy the entrypoint script into the container
COPY entrypoint.sh /entrypoint.sh

# Set the entrypoint to the provided script
ENTRYPOINT ["/entrypoint.sh"]
