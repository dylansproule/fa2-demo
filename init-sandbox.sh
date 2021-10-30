#!/bin/sh

docker run --rm \
  --name tezos-flextesa \
  -e flextesa_node_cors_origin='*' \
  -e block_time=1 \
  --detach -p 20000:20000 \
  $docker_image \
  $box_script \
  start

# Setup sandbox
tezos-client config reset
tezos-client --endpoint http://localhost:20000 bootstrapped
tezos-client --endpoint http://localhost:20000 config update

# Output address info
docker run --rm $docker_image $box_script info
