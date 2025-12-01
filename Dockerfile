FROM python:3.11-slim AS builder

WORKDIR /app

COPY requirements.txt .

RUN pythom -m venv /venv && \
    /venv/bin/pip install --no-cache-dir -r requirements.txt

FROM python:3.11-slim

RUN useradd -m -u 1003 appuser && \
    mkdir /app && \
    chown appuser:appuser /app

COPY --from=builder --chown=appuser:appuser /venv /venv 

COPY --chown=appuser:appuser . .

USER appuser

EXPOSE 5000

ENV PATH="/venv/bin:$PATH"

CMD ["gunicorn","--bind","0.0.0.0:5000","app:app","--access-logfile","-"]

