import Foundation

struct Deal: Identifiable, Codable, Hashable {
    let id: UUID
    var name: String
    var value: Decimal
    var commissionRate: Decimal
    var stage: Stage

    enum Stage: String, CaseIterable, Codable {
        case lead = "Lead"
        case active = "Active"
        case won = "Won"
        case lost = "Lost"
    }

    var estimatedCommission: Decimal { value * commissionRate }
}
