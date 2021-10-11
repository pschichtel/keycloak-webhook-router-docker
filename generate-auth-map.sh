#!/usr/bin/env sh

target_mappings="$(jq -r -n 'env | to_entries | map(select(.key | startswith("KEYCLOAK_WEBHOOK_AUTH_"))) | map("    " + .key[22:] + " \"" + .value + "\";") | .[]')"
targets_file="/etc/nginx/conf.d/auth.conf"

echo 'map $http_x_keycloak_realm $target_auth {' > "$targets_file"
echo "$target_mappings" >> "$targets_file"
echo '}' >> "$targets_file"
