#!/bin/sh
source bash_config.sh
cd smart-contracts

contract_name="fa2-rpc"
account_owner_name="florence"
storage_init="$(cat $storage_out)"

tezos-client originate contract $contract_name \
  transferring $transfer_amount \
  from $account_owner_name \
  running $contract_out \
  --init "$storage_init" \
  --burn-cap $burn_cap
