import BlindBoxRedeemVoucher from "../contracts/BlindBoxRedeemVoucher.cdc"

pub fun main(itemID: UInt64): BlindBoxRedeemVoucher.Metadata {
    return BlindBoxRedeemVoucher.getMetadata(itemID: itemID)!
}
