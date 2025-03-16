FROM ghcr.io/astral-sh/uv:bookworm-slim

RUN apt-get update && apt-get install -y --no-install-recommends \
    sudo openssh-server git vim \
    && rm -rf /var/lib/apt/lists/*

RUN useradd --create-home --shell /bin/bash vizuser
RUN usermod -aG sudo vizuser
RUN echo 'vizuser:vizuser' | chpasswd

USER vizuser

WORKDIR /home/vizuser

COPY pyproject.toml pyproject.toml 
COPY uv.lock uv.lock 
