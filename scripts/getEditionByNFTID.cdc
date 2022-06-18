import NonFungibleToken from "../contracts/NonFungibleToken.cdc"
import MetadataViews from "../contracts/MetadataViews.cdc"
import BlindBoxRedeemVoucher from "../contracts/BlindBoxRedeemVoucher.cdc"

pub fun main(address: Address, nftID: UInt64): MetadataViews.Edition {
    let collectionRef = getAccount(address).getCapability(BlindBoxRedeemVoucher.CollectionPublicPath)
        .borrow<&{NonFungibleToken.CollectionPublic, BlindBoxRedeemVoucher.CollectionPublic}>()
        ?? panic("Could not borrow collection public reference")

    let voucher = collectionRef.borrowBlindBoxRedeemVoucher(id: nftID)!

    return voucher.resolveView(Type<MetadataViews.Edition>())! as! MetadataViews.Edition
}
