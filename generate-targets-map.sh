#!/usr/bin/env sh

target_mappings="$(jq -r -n 'env | to_entries | map(select(.key | startswith("KEYCLOAK_WEBHOOK_URL_"))) | map("    " + .key[21:] + " \"" + .value + "\";") | .[]')"
targets_file="/etc/nginx/conf.d/targets.conf"
if [ -n "$target_mappings" -a -w "$targets_file" ]
then
    echo 'map $http_x_keycloak_realm $webhook_target {' > "$targets_file"
    echo "$target_mappings" >> "$targets_file"
    echo '}' >> "$targets_file"
fi
