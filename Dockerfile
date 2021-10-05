FROM nginx:mainline-alpine

COPY router.conf /etc/nginx/conf.d/default.conf
COPY targets.conf /etc/nginx/conf.d/targets.conf
