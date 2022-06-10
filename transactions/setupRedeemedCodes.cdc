transaction {

    prepare(signer: AuthAccount) {
        let redeemedCodes: {String: Bool} = {}
        signer.save<{String: Bool}>(redeemedCodes, to: /storage/redeemedCodes)
    }
}
