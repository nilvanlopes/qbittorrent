#!/usr/bin/with-contenv bash

set -eu

conf="/config/qBittorrent/qBittorrent.conf"

mkdir -p "$(dirname "$conf")"
touch "$conf"

set_pref() {
  key="$1"
  value="$2"

  if grep -Fq "$key=" "$conf"; then
    sed -i "s|^$key=.*|$key=$value|" "$conf"
  else
    printf '%s=%s\n' "$key" "$value" >> "$conf"
  fi
}

set_pref 'WebUI\\Address' '*'
set_pref 'WebUI\\AuthSubnetWhitelist' '0.0.0.0/0, ::/0'
set_pref 'WebUI\\AuthSubnetWhitelistEnabled' 'true'
set_pref 'WebUI\\HostHeaderValidation' 'false'
set_pref 'WebUI\\LocalHostAuth' 'false'
set_pref 'WebUI\\Port' '8081'
set_pref 'WebUI\\ServerDomains' '*'
