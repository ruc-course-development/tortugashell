FROM mambaorg/micromamba:1.5.0

COPY --chown=$MAMBA_USER:$MAMBA_USER environment.yml /tmp/environment.yml

RUN micromamba install -y -n base -f /tmp/environment.yml && \
    micromamba clean --all --yes

USER root
RUN apt-get update && apt-get install -y --no-install-recommends \
    git openssh-server \
    && rm -rf /var/lib/apt/lists/*
USER $MAMBA_USER