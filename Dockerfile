FROM nginx:mainline-alpine

RUN apk add --update --no-cache jq

COPY router.conf /etc/nginx/conf.d/default.conf
COPY targets.conf /etc/nginx/conf.d/targets.conf
