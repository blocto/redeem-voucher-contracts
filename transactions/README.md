# Token
### Setup Collection
```
flow transactions send ./transactions/setupCollection.cdc \
  --network testnet \
  --signer voucher-user-testnet \
  --gas-limit 1000
```

### Transfer Collectible
```
flow transactions send ./transactions/transferBlindBoxRedeemVoucher.cdc 0 0x759a73541fce0ae9 \
  --network mainnet \
  --signer user-mainnet \
  --gas-limit 1000
```

### Register Metadata
```
flow transactions send ./transactions/registerMetadata.cdc \
  --network testnet \
  --args-json "$(cat "./arguments/metadata.json")" \
  --signer voucher-admin-testnet \
  --gas-limit 1000
```

### Mint NFT
```
flow transactions send ./transactions/mintBlindBoxRedeemVoucher.cdc 0x66ca989c2cd296fb 0 \
  --network testnet \
  --signer voucher-admin-testnet \
  --gas-limit 1000
```

### Mint NFT in Batch
```
flow transactions send ./transactions/mintBlindBoxRedeemVoucherBatch.cdc 0x66ca989c2cd296fb 0 5 \
  --network testnet \
  --signer voucher-admin-testnet \
  --gas-limit 9999
```

### Create minter reference
```
flow transactions build ./transactions/createReference.cdc \
  --network mainnet \
  --proposer 0x758252ab932a3416 \
  --proposer-key-index 0 \
  --authorizer 0x758252ab932a3416 \
  --authorizer 0xc5114307711ef6c2 \
  --payer 0xc5114307711ef6c2 \
  -x payload \
  --save ./build/unsigned.rlp

flow transactions sign ./build/unsigned.rlp \
  --signer voucher-admin-mainnet \
  --filter payload \
  --save ./build/signed-1.rlp

flow transactions sign ./build/signed-1.rlp \
  --signer voucher-admin-backend-mainnet \
  --filter payload \
  --save ./build/signed-2.rlp

flow transactions send-signed --network mainnet ./build/signed-2.rlp
```
