#!/bin/sh
docker run --rm --name telos-flextesa --detach -p 20000:20000 tqtezos/flextesa:20210602 flobox start

#Setup sandbox
tezos-client config reset
tezos-client --endpoint http://localhost:20000 bootstrapped
tezos-client --endpoint http://localhost:20000 config update

#Output address info
docker run --rm tqtezos/flextesa:20210602 flobox info
