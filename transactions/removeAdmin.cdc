transaction {

  prepare(signer: AuthAccount) {
    let oldAdmin <- signer.load<@AnyResource>(from: /storage/BlindBoxRedeemVoucherAdmin)
    destroy oldAdmin

    let oldCollection <- signer.load<@AnyResource>(from: /storage/BlindBoxRedeemVoucherCollection)
    destroy oldCollection
  }
}
