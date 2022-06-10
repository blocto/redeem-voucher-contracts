import YahooPartnersCollectible from "../contracts/YahooPartnersCollectible.cdc"

pub fun main(itemID: UInt64): YahooPartnersCollectible.Metadata? {
    return YahooPartnersCollectible.getMetadata(itemID: itemID)
}
