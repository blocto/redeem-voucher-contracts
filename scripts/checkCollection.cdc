import NonFungibleToken from "../contracts/NonFungibleToken.cdc"
import BlindBoxRedeemCode from "../contracts/BlindBoxRedeemCode.cdc"

pub fun main(account: Address): Bool {
	let publicRef = getAccount(account).getCapability(BlindBoxRedeemCode.CollectionPublicPath)!
    .borrow<&{NonFungibleToken.CollectionPublic, BlindBoxRedeemCode.CollectionPublic}>()

  return publicRef != nil
}
