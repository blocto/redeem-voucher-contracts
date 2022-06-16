# Token
### Check if an account has collection enabled
```
flow scripts execute ./scripts/checkCollection.cdc 0xeec852ceb51a5fb3 \
  --network testnet
```

### Get Metadata for a BlindBoxRedeemVoucher
```
flow scripts execute ./scripts/getMetadata.cdc 0xeec852ceb51a5fb3 0 \
  --network testnet
```

### Get Metadata for a typeID from CaaPass
```
flow scripts execute ./scripts/getMetadataForItemID.cdc 0 \
  --network testnet
```
