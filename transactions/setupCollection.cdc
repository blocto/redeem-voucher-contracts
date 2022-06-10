import NonFungibleToken from "../contracts/NonFungibleToken.cdc"
import BlindBoxRedeemCode from "../contracts/BlindBoxRedeemCode.cdc"

transaction {

    prepare(signer: AuthAccount) {
        if signer.borrow<&BlindBoxRedeemCode.Collection>(from: BlindBoxRedeemCode.CollectionStoragePath) == nil {

            let collection <- BlindBoxRedeemCode.createEmptyCollection() as! @BlindBoxRedeemCode.Collection

            signer.save(<-collection, to: BlindBoxRedeemCode.CollectionStoragePath)

            signer.link<&BlindBoxRedeemCode.Collection{NonFungibleToken.CollectionPublic, BlindBoxRedeemCode.CollectionPublic}>(
                BlindBoxRedeemCode.CollectionPublicPath,
                target: BlindBoxRedeemCode.CollectionStoragePath)
        }
    }
}
