#!/bin/sh
source bash_config.sh
cd smart-contracts

ligo compile contract $contract_src \
  --entry-point $entry_point \
  --protocol $protocol \
  --output-file $contract_out
