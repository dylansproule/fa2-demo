#!/bin/sh
image=tqtezos/flextesa:20211025

docker run --rm --name tezos-flextesa --detach -p 20000:20000 "$image" granabox start

# Setup sandbox
tezos-client config reset
tezos-client --endpoint http://localhost:20000 bootstrapped
tezos-client --endpoint http://localhost:20000 config update

# Output address info
docker run --rm "$image" granabox info
