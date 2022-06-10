import NonFungibleToken from "../contracts/NonFungibleToken.cdc"
import BlindBoxRedeemVoucher from "../contracts/BlindBoxRedeemVoucher.cdc"

transaction {

    prepare(signer: AuthAccount) {
        if signer.borrow<&BlindBoxRedeemVoucher.Collection>(from: BlindBoxRedeemVoucher.CollectionStoragePath) == nil {

            let collection <- BlindBoxRedeemVoucher.createEmptyCollection() as! @BlindBoxRedeemVoucher.Collection

            signer.save(<-collection, to: BlindBoxRedeemVoucher.CollectionStoragePath)

            signer.link<&BlindBoxRedeemVoucher.Collection{NonFungibleToken.CollectionPublic, BlindBoxRedeemVoucher.CollectionPublic}>(
                BlindBoxRedeemVoucher.CollectionPublicPath,
                target: BlindBoxRedeemVoucher.CollectionStoragePath)
        }
    }
}
