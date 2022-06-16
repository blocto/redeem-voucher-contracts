import NonFungibleToken from "../contracts/NonFungibleToken.cdc"
import BlindBoxRedeemVoucher from "../contracts/BlindBoxRedeemVoucher.cdc"

pub fun main(address: Address, index: Int): UInt64 {
    let collectionRef = getAccount(address).getCapability(BlindBoxRedeemVoucher.CollectionPublicPath)
        .borrow<&{NonFungibleToken.CollectionPublic, BlindBoxRedeemVoucher.CollectionPublic}>()
        ?? panic("Could not borrow collection public reference")

    let ids = collectionRef.getIDs()
    let voucher = collectionRef.borrowBlindBoxRedeemVoucher(id: ids[index])!

    return voucher.editionNumber
}
