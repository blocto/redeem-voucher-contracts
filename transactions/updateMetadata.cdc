import NonFungibleToken from "../contracts/NonFungibleToken.cdc"
import BlindBoxRedeemVoucher from "../contracts/BlindBoxRedeemVoucher.cdc"

transaction(itemID: UInt64, title: String, description: String, mediaType: String, mediaHash: String, rarity: String) {

    prepare(signer: AuthAccount) {
        let admin = signer
            .borrow<&BlindBoxRedeemVoucher.Admin>(from: BlindBoxRedeemVoucher.AdminStoragePath)
            ?? panic("Signer is not the admin")

        let metadata: BlindBoxRedeemVoucher.Metadata = BlindBoxRedeemVoucher.Metadata(
            name: title,
            description: description,
            mediaType: mediaType,
            mediaHash: mediaHash,
            additional: {
                "rarity": rarity
            }
        )

        admin.updateMetadata(itemID: itemID, metadata: metadata)
    }
}
