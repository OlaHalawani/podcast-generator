FROM ubuntu:latest

RUN apt-get update && apt-get install -y \
    python3.10 \
    python3-pip \
    git \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Check pip version
RUN python3.10 -m pip --version
# Add debug output
RUN pip3 --version
RUN pip3 install --upgrade pip || { echo "Failed to upgrade pip"; exit 1; }
RUN pip3 install PyYAML || { echo "Failed to install PyYAML"; exit 1; }
RUN python3.10 -m pip install --upgrade pip --no-cache-dir

RUN python3.10 -m pip install PyYAML --no-cache-dir

COPY feed.py /usr/bin/feed.py

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]
