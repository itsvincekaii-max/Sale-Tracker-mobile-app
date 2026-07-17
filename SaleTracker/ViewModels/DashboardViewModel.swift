import Foundation

@MainActor
final class DashboardViewModel: ObservableObject {
    @Published private(set) var deals: [Deal] = []

    var activePipelineValue: Decimal {
        deals.filter { $0.stage == .lead || $0.stage == .active }
            .reduce(0) { $0 + $1.value }
    }

    var closedRevenue: Decimal {
        deals.filter { $0.stage == .won }.reduce(0) { $0 + $1.value }
    }

    func add(_ deal: Deal) {
        deals.append(deal)
    }
}
