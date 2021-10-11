FROM nginx:mainline-alpine

RUN apk add --update --no-cache jq

COPY router.conf /router.conf

COPY generate-targets-map.sh /docker-entrypoint.d/generate-targets-map.sh
COPY generate-auth-map.sh /docker-entrypoint.d/generate-auth-map.sh
COPY generate-router-conf.sh /docker-entrypoint.d/generate-router-conf.sh

ENV WEBHOOK_ENDPOINT=/webhook

