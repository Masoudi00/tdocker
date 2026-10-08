FROM alpine:3.22

LABEL org.opencontainers.image.source="https://github.com/Masoudi00/tdocker"
LABEL org.opencontainers.image.description="tdocker starter container"

WORKDIR /app
COPY README.md ./README.md

USER 10001:10001
CMD ["cat", "/app/README.md"]
