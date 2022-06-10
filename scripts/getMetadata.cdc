import NonFungibleToken from "../contracts/NonFungibleToken.cdc"
import BlindBoxRedeemVoucher from "../contracts/BlindBoxRedeemVoucher.cdc"

pub fun main(address: Address, index: Int): BlindBoxRedeemVoucher.Metadata? {
    let collectionRef = getAccount(address).getCapability(BlindBoxRedeemVoucher.CollectionPublicPath)
        .borrow<&{NonFungibleToken.CollectionPublic, BlindBoxRedeemVoucher.CollectionPublic}>()
        ?? panic("Could not borrow collection public reference")

    let ids = collectionRef.getIDs()
    let BlindBoxRedeemVoucher = collectionRef.borrowBlindBoxRedeemVoucher(id: ids[index])!

    return BlindBoxRedeemVoucher.getMetadata()
}
