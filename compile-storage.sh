#!/bin/sh
source bash_config.sh
cd smart-contracts

ligo compile storage $contract_src \
  "`cat $storage_expression`" \
  --entry-point $entry_point \
  --protocol $protocol \
  --michelson-format $michelson_format \
  --output-file $storage_out
  