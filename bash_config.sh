#!/bin/sh

# Docker parameters
docker_image="tqtezos/flextesa:20211025"
box_script="hangzbox"

# Contract / Storage parameters
# Note: paths are relative from the smart-contracts directory
protocol="hangzhou"
contract_src="fa2_hooks/ligo/src/fa2_multi_asset.mligo"
contract_out="fa2.tz"
storage_expression="../storage.mligo"
storage_out="storage.tz"
entry_point="multi_asset_main"
michelson_format="text"

# Originate parameters
burn_cap=1.6375
transfer_amount=0
