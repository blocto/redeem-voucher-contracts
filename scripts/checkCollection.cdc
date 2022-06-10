import NonFungibleToken from "../contracts/NonFungibleToken.cdc"
import BlindBoxRedeemVoucher from "../contracts/BlindBoxRedeemVoucher.cdc"

pub fun main(account: Address): Bool {
	let publicRef = getAccount(account).getCapability(BlindBoxRedeemVoucher.CollectionPublicPath)!
    .borrow<&{NonFungibleToken.CollectionPublic, BlindBoxRedeemVoucher.CollectionPublic}>()

  return publicRef != nil
}
