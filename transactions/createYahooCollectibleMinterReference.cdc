import BlindBoxRedeemVoucher from "../contracts/BlindBoxRedeemVoucher.cdc"

transaction {
  prepare(admin: AuthAccount, newAdmin: AuthAccount) {
    // Check admin resource
    let adminRef = admin.borrow<&BlindBoxRedeemVoucher.Admin>(from: BlindBoxRedeemVoucher.AdminStoragePath)
      ?? panic("failed to borrow &BlindBoxRedeemVoucher.Admin")

    admin.unlink(/private/BlindBoxRedeemVoucherAdmin)
    let adminCapability: Capability<&BlindBoxRedeemVoucher.Admin> = admin.link<&BlindBoxRedeemVoucher.Admin>(
        /private/BlindBoxRedeemVoucherAdmin,
        target: BlindBoxRedeemVoucher.AdminStoragePath
    ) ?? panic("failed to create capability")

    newAdmin.save<Capability<&BlindBoxRedeemVoucher.Admin>>(adminCapability, to: BlindBoxRedeemVoucher.AdminStoragePath)
  }
}
