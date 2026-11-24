# ---- Image de base -------------------------------------------------------
FROM python:3.12-slim-bookworm

# ---- uv : binaire officiel copié depuis l'image d'Astral -----------------
COPY --from=ghcr.io/astral-sh/uv:0.9.5 /uv /uvx /usr/local/bin/

# ---- Variables d'environnement -------------------------------------------
ENV PYTHONUNBUFFERED=1 \
    PYTHONDONTWRITEBYTECODE=1 \
    UV_LINK_MODE=copy \
    UV_COMPILE_BYTECODE=1 \
    UV_PYTHON_DOWNLOADS=never \
    UV_PROJECT_ENVIRONMENT=/opt/venv \
    PATH="/opt/venv/bin:$PATH"

# ---- Paquets système (minimum utile) -------------------------------------
RUN apt-get update \
 && apt-get install -y --no-install-recommends git zsh ca-certificates \
 && rm -rf /var/lib/apt/lists/*

WORKDIR /python_project

CMD ["tail", "-f", "/dev/null"]