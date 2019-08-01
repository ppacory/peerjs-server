#!/usr/bin/env sh

# Run nginx
#nginx -g "daemon off;"
service nginx start

# Run peerjs-server
./bin/peerjs --port "9000" --path "/myapp"
