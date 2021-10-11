#!/usr/bin/env sh

target_mappings="$(jq -r -n 'env | to_entries | map(select(.key | startswith("KEYCLOAK_WEBHOOK_AUTH_"))) | map("    " + .key[21:] + " \"" + .value + "\";") | .[]')"
targets_file="/etc/nginx/conf.d/auth.conf"
if [ -n "$target_mappings" -a -w "$targets_file" ]
then
    echo 'map $http_x_keycloak_realm $target_uath {' > "$targets_file"
    echo "$target_mappings" >> "$targets_file"
    echo '}' >> "$targets_file"
fi
