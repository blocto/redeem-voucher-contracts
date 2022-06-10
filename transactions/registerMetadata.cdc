import NonFungibleToken from "../contracts/NonFungibleToken.cdc"
import BlindBoxRedeemCode from "../contracts/BlindBoxRedeemCode.cdc"

transaction(itemID: UInt64, title: String, description: String, mediaType: String, mediaHash: String, rarity: String) {

    prepare(signer: AuthAccount) {
        let admin = signer
            .borrow<&BlindBoxRedeemCode.Admin>(from: BlindBoxRedeemCode.AdminStoragePath)
            ?? panic("Signer is not the admin")

        let metadata: BlindBoxRedeemCode.Metadata = BlindBoxRedeemCode.Metadata(
            name: title,
            description: description,
            mediaType: mediaType,
            mediaHash: mediaHash,
            additional: {
                "rarity": rarity
            }
        )

        admin.registerMetadata(itemID: itemID, metadata: metadata)
    }
}
