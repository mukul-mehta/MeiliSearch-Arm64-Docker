FROM debian:stable-slim

ENV MEILISEARCH_VERSION 0.21.1

WORKDIR /usr/local

RUN apt-get update && apt-get install --no-install-recommends -y \
    wget \
    ca-certificates

RUN wget --quiet -O meilisearch https://github.com/meilisearch/MeiliSearch/releases/download/v${MEILISEARCH_VERSION}/meilisearch-linux-armv8 \
    && chmod +x meilisearch

ENV MEILI_HTTP_ADDR 0.0.0.0:7700
EXPOSE 7700

CMD ./meilisearch
