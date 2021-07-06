# FA2 Demo

## Overview

This is a trivial overview of how to originate and mint an FA2 contract.

Confusingly, the sh scripts are relative to the base of the `smart-contracts` submodule. In any case they are not necessary for running the scripts.

## How to use.

First install pytezos, however you wish.

The following is a transcript of the REPL session which I used to set up this contract.

```
(venv) newby@stink:~/projects/tezos/fa2-demo$ python3
Python 3.8.10 (default, Jun  2 2021, 10:49:15)
[GCC 10.3.0] on linux
Type "help", "copyright", "credits" or "license" for more information.
>>> import fa2
>>> fa2.initialize()
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
  File "/home/newby/projects/tezos/fa2-demo/fa2.py", line 50, in initialize
    res = account.bulk(*operations).autofill(gas_limit=100000, fee=280000).sign().inject(_async = False)
NameError: name 'account' is not defined
>>>
(venv) newby@stink:~/projects/tezos/fa2-demo$ python3
Python 3.8.10 (default, Jun  2 2021, 10:49:15)
[GCC 10.3.0] on linux
Type "help", "copyright", "credits" or "license" for more information.
>>> import fa2
>>> fa2.initialize()
Wait 21 seconds until block BKvNAGzahPCpoE9zfD2E7KUb9fpz5zCBKoEoGU5mprETDM85GDj is finalized
{'protocol': 'PsFLorenaUUuikDWvMDr6fGBRG8kt3e3D3fHoXK1j1BFRxeSH4i', 'chain_id': 'NetXxkAx4woPLyu', 'hash': 'ookYAXmV4NgXd5NtEgvzNtNMcHwzv2CiG2RUAAmfvsC1dupCcAQ', 'branch': 'BL2XQpfHf24aV6KhRmtEn3CPm1nwSzvecrfErpnAwa7qFRfc2mb', 'contents': [{'kind': 'transaction', 'source': 'tz1RjonN5qEJM8cZhKcfGyoEqhw1FNB4ti6w', 'fee': '280000', 'counter': '198726', 'gas_limit': '100000', 'storage_limit': '316', 'amount': '0', 'destination': 'KT1XtDdQcB6WCtnUsv8Da7fRNVN7teMunsvS', 'parameters': {'entrypoint': 'create_token', 'value': {'prim': 'Pair', 'args': [{'int': '1'}, [{'prim': 'Elt', 'args': [{'string': 'isTransferable'}, {'bytes': '74727565'}]}, {'prim': 'Elt', 'args': [{'string': 'name'}, {'bytes': '746f6b656e2d31'}]}, {'prim': 'Elt', 'args': [{'string': 'symbol'}, {'bytes': '544b4e31'}]}]]}}, 'metadata': {'balance_updates': [{'kind': 'contract', 'contract': 'tz1RjonN5qEJM8cZhKcfGyoEqhw1FNB4ti6w', 'change': '-280000', 'origin': 'block'}, {'kind': 'freezer', 'category': 'fees', 'delegate': 'tz1aWXP237BLwNHJcCD4b3DutCevhqq2T1Z9', 'cycle': 157, 'change': '280000', 'origin': 'block'}], 'operation_result': {'status': 'applied', 'storage':
```
many lines omitted
```
7'}]}, 'big_map_diff': [{'action': 'update', 'big_map': '88096', 'key_hash': 'exprutQkbiKNaV5aj1k6i3mtoReS8W6xBgUFYENQqfdrCixmMc4dMG', 'key': {'int': '49'}, 'value': {'int': '1'}}, {'action': 'update', 'big_map': '88093', 'key_hash': 'exprtXVhQBoBX8fbp7EaDHp3kLbPX3mGEatCQeHWTvYFNzby998qZ6', 'key': {'prim': 'Pair', 'args': [{'bytes': '000042e8795f422a2e5fd11fd3b2eab6fe3f6255455a'}, {'int': '49'}]}, 'value': {'int': '1'}}], 'balance_updates': [{'kind': 'contract', 'contract': 'tz1RjonN5qEJM8cZhKcfGyoEqhw1FNB4ti6w', 'change': '-16750', 'origin': 'block'}], 'consumed_gas': '36451', 'consumed_milligas': '36450188', 'storage_size': '20240', 'paid_storage_size_diff': '67', 'lazy_storage_diff': [{'kind': 'big_map', 'id': '88097', 'diff': {'action': 'update', 'updates': []}}, {'kind': 'big_map', 'id': '88096', 'diff': {'action': 'update', 'updates': [{'key_hash': 'exprutQkbiKNaV5aj1k6i3mtoReS8W6xBgUFYENQqfdrCixmMc4dMG', 'key': {'int': '49'}, 'value': {'int': '1'}}]}}, {'kind': 'big_map', 'id': '88095', 'diff': {'action': 'update', 'updates': []}}, {'kind': 'big_map', 'id': '88094', 'diff': {'action': 'update', 'updates': []}}, {'kind': 'big_map', 'id': '88093', 'diff': {'action': 'update', 'updates': [{'key_hash': 'exprtXVhQBoBX8fbp7EaDHp3kLbPX3mGEatCQeHWTvYFNzby998qZ6', 'key': {'prim': 'Pair', 'args': [{'bytes': '000042e8795f422a2e5fd11fd3b2eab6fe3f6255455a'}, {'int': '49'}]}, 'value': {'int': '1'}}]}}]}}}], 'signature': 'signYmHpVicz95pN78VQKndvDLB5qjyyWTS3okDxCiqS72vrPp3u82woEFMDMM9yVVMgLLzjsLzeK3pNX78Muy3CkKzY1ZjM'}
>>> fa2.transfer
<function transfer at 0x7fb7718743a0>
>>> fa2.transfer()
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
TypeError: transfer() missing 2 required positional arguments: 'token_id' and 'dest'
>>> fa2.transfer(1, "tz1RjonN5qEJM8cZhKcfGyoEqhw1FNB4ti6w")
>>>
```
