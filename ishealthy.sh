#!/bin/bash

set -o errexit -o nounset

for proxy_url in "socks5h://127.0.0.1:9050" "http://127.0.0.1:8118"; do
    curl -sS --proxy "$proxy_url" "https://check.torproject.org/api/ip" | jq -r ".IsTor" | fgrep -q -x "true"
done

echo OK
exit 0
