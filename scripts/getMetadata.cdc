import NonFungibleToken from "../contracts/NonFungibleToken.cdc"
import BlindBoxRedeemCode from "../contracts/BlindBoxRedeemCode.cdc"

pub fun main(address: Address, index: Int): BlindBoxRedeemCode.Metadata? {
    let collectionRef = getAccount(address).getCapability(BlindBoxRedeemCode.CollectionPublicPath)
        .borrow<&{NonFungibleToken.CollectionPublic, BlindBoxRedeemCode.CollectionPublic}>()
        ?? panic("Could not borrow collection public reference")

    let ids = collectionRef.getIDs()
    let BlindBoxRedeemCode = collectionRef.borrowBlindBoxRedeemCode(id: ids[index])!

    return BlindBoxRedeemCode.getMetadata()
}
