#!/bin/sh
source bash_config.sh
cd smart-contracts

contract_name="fa2-sandbox"
account_owner_name="bob"
storage_init="$(cat $storage_out)"

# Force originate sandbox contract for testing iterations
tezos-client originate contract $contract_name \
  transferring $transfer_amount \
  from $account_owner_name \
  running $contract_out \
  --init "$storage_init" \
  --burn-cap $burn_cap \
  --force
