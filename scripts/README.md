# Token
### Check if an account has collection enabled
```
flow scripts execute ./scripts/checkCollection.cdc 0x66ca989c2cd296fb \
  --network testnet
```

### Get Metadata for a BlindBoxRedeemCode
```
flow scripts execute ./scripts/getMetadata.cdc 0x66ca989c2cd296fb 0 \
  --network testnet
```

### Get Metadata for a typeID from CaaPass
```
flow scripts execute ./scripts/getMetadataForItemID.cdc 0 \
  --network testnet
```
