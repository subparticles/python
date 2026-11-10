
# ===== STAGE 1: BUILDER =====
FROM ghcr.io/astral-sh/uv:0.11.6-trixie-slim AS builder

ENV UV_PYTHON_INSTALL_DIR=/opt/python \
    UV_PYTHON=3.14t

RUN uv python install 3.14t \
    && ln -s "$(uv python find 3.14t)" /opt/python/bin-python


# ===== STAGE 2: RUNTIME =====
FROM debian:trixie-slim

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        ca-certificates \
        libgcc-s1 \
        libstdc++6 \
    && rm -rf /var/lib/apt/lists/*

# Copy only Python; create executable symlinks in the runtime stage.
COPY --from=builder /opt/python /opt/python
RUN ln -s /opt/python/bin-python /usr/local/bin/python \
    && ln -s /usr/local/bin/python /usr/local/bin/python3

