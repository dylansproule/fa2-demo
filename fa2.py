#!/usr/bin/env python3
import json

SANDBOX = 1

# Load config
config_json = open('config.json')
config = json.load(config_json)
config_json.close()

# Setup relevant config
if SANDBOX:
    print('Running in sandbox mode')
    config = config['sandbox_rpc']
else:
    print('Running in rpc mode')
    config = config['rpc']

shell_rpc = config['shell_rpc']
owner_address = config['owner_address']
owner_private_key = config['owner_private_key']
contract_id = config['contract_id']

from pytezos import pytezos

def admin_account():
    ''' Return an initialised pytezos object using the admin key defined in this file '''
    return pytezos.using(
        key = owner_private_key,
        shell = shell_rpc)

def contract():
    ''' Return an initialised contract object for the FA2 contract with id above'''
    client = admin_account()
    return client.contract(contract_id)

def initialize():
    contract_ = contract()
    account = admin_account()
    operations = []
    results = []
    for i in range(1,50):
        name = f"token-{i}"
        count = 1
        symbol = f"TKN{i}"
        token_id = i
        operations.append(contract_.create_token(token_id, {
            "name": name.encode('utf-8'),
            "symbol": symbol.encode('utf-8'),
            "isTransferable": "true".encode('utf-8'),
        }))
        operations.append(contract_.mint_tokens(
            [
                {
                    "owner": owner_address,
                    "token_id": token_id,
                    "amount": count
                }
            ]
        ))
        results.append({
            "name": name,
            "token_id": token_id,
            "symbol": symbol,
            "minted": count,
            "owner": owner_address,
        })

    res = account.bulk(*operations).autofill(gas_limit=100000, fee=280000).sign().inject(_async = False)
    return res

# Needed to unpause, like this:
# >>> c.pause(False).inject()


def transfer(token_id, dest):
    c = contract()
    c.transfer(
        [ { "from_": admin_account().key.public_key_hash(),
            "txs": [
                { "to_": dest,
                  "token_id": token_id,
                  "amount": 1 }]}]).inject()
