#!/usr/bin/env sh

export DNS_RESOLVER_IP="$(grep nameserver /etc/resolv.conf | cut -d' ' -f2 | tr '\n' ' ')"

cat /router.conf | envsubst '$DNS_RESOLVER_IP,$WEBHOOK_ENDPOINT' > /etc/nginx/conf.d/default.conf

