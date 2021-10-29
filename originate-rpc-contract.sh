#!/bin/sh

cd smart-contracts

contract_name="fa2-rpc"
burn_cap=1.6375
transfer_amount=0
account_owner_name="florence"

tezos-client originate contract $contract_name transferring $transfer_amount from $account_owner_name running fa2.tz --init "`cat storage.tz`" --burn-cap $burn_cap