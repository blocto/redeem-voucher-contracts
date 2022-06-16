import NonFungibleToken from "../contracts/NonFungibleToken.cdc"
import BlindBoxRedeemVoucher from "../contracts/BlindBoxRedeemVoucher.cdc"

transaction(address: Address, itemID: UInt64, count: Int) {

    prepare(signer: AuthAccount) {
        let minter = signer
            .borrow<&BlindBoxRedeemVoucher.Admin>(from: BlindBoxRedeemVoucher.AdminStoragePath)
            ?? panic("Signer is not the admin")

        let nftCollectionRef = getAccount(address).getCapability(BlindBoxRedeemVoucher.CollectionPublicPath)
            .borrow<&{NonFungibleToken.CollectionPublic}>()
            ?? panic("Could not borrow BlindBoxRedeemVoucher collection public reference")

        minter.batchMintNFT(recipient: nftCollectionRef, itemID: itemID, count: count)
    }
}
