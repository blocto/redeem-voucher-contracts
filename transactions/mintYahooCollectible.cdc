import NonFungibleToken from "../contracts/NonFungibleToken.cdc"
import BlindBoxRedeemCode from "../contracts/BlindBoxRedeemCode.cdc"

transaction(address: Address, itemID: UInt64) {

    prepare(signer: AuthAccount) {
        let minter = signer
            .borrow<&BlindBoxRedeemCode.Admin>(from: BlindBoxRedeemCode.AdminStoragePath)
            ?? panic("Signer is not the admin")

        let nftCollectionRef = getAccount(address).getCapability(BlindBoxRedeemCode.CollectionPublicPath)
            .borrow<&{NonFungibleToken.CollectionPublic}>()
            ?? panic("Could not borrow BlindBoxRedeemCode collection public reference")

        minter.mintNFT(recipient: nftCollectionRef, itemID: itemID)
    }
}
