import SwiftUI

struct DashboardView: View {
    @StateObject private var viewModel = DashboardViewModel()

    var body: some View {
        NavigationStack {
            List {
                Section("Overview") {
                    metric("Active pipeline", viewModel.activePipelineValue)
                    metric("Closed revenue", viewModel.closedRevenue)
                }

                Section("Deals") {
                    if viewModel.deals.isEmpty {
                        ContentUnavailableView("No deals yet", systemImage: "chart.line.uptrend.xyaxis")
                    } else {
                        ForEach(viewModel.deals) { deal in
                            LabeledContent(deal.name, value: deal.stage.rawValue)
                        }
                    }
                }
            }
            .navigationTitle("Sale Tracker")
        }
    }

    private func metric(_ title: String, _ value: Decimal) -> some View {
        LabeledContent(title, value: value, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
    }
}

#Preview { DashboardView() }
