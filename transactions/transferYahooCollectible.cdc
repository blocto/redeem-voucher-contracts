import NonFungibleToken from "../contracts/NonFungibleToken.cdc"
import BlindBoxRedeemCode from "../contracts/BlindBoxRedeemCode.cdc"

transaction(id: UInt64, to: Address) {
	let sentNFT: @NonFungibleToken.NFT

  	let address: Address

	prepare(signer: AuthAccount) {
		let collectionRef = signer.borrow<&NonFungibleToken.Collection>(from: BlindBoxRedeemCode.CollectionStoragePath)
		?? panic("Could not borrow reference collection")

		self.sentNFT <- collectionRef.withdraw(withdrawID: id)
		self.address = signer.address
	}

	execute {
		let recipient = getAccount(to)

		let receiverRef = recipient.getCapability(BlindBoxRedeemCode.CollectionPublicPath).borrow<&{NonFungibleToken.CollectionPublic}>()
		?? panic("Could not borrow receiver reference to the recipient''s Vault")

		receiverRef.deposit(token: <-self.sentNFT)
	}
}
