#!/usr/bin/env sh

# Run nginx
nginx -g "daemon off;"

# Run peerjs-server
/peer-server/bin/peerjs --port "9000" --path "/myapp"
