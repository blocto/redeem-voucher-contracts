import BlindBoxRedeemCode from "../contracts/BlindBoxRedeemCode.cdc"

transaction {
  prepare(admin: AuthAccount, newAdmin: AuthAccount) {
    // Check admin resource
    let adminRef = admin.borrow<&BlindBoxRedeemCode.Admin>(from: BlindBoxRedeemCode.AdminStoragePath)
      ?? panic("failed to borrow &BlindBoxRedeemCode.Admin")

    admin.unlink(/private/BlindBoxRedeemCodeAdmin)
    let adminCapability: Capability<&BlindBoxRedeemCode.Admin> = admin.link<&BlindBoxRedeemCode.Admin>(
        /private/BlindBoxRedeemCodeAdmin,
        target: BlindBoxRedeemCode.AdminStoragePath
    ) ?? panic("failed to create capability")

    newAdmin.save<Capability<&BlindBoxRedeemCode.Admin>>(adminCapability, to: BlindBoxRedeemCode.AdminStoragePath)
  }
}
