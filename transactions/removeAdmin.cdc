transaction {

  prepare(signer: AuthAccount) {
    let oldAdmin <- signer.load<@AnyResource>(from: /storage/BlindBoxRedeemCodeAdmin)
    destroy oldAdmin

    let oldCollection <- signer.load<@AnyResource>(from: /storage/BlindBoxRedeemCodeCollection)
    destroy oldCollection
  }
}
