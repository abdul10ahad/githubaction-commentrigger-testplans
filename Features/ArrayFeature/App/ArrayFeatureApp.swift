import SwiftUI
import ArrayFeature

@main
struct ArrayFeatureApp: App {
    var body: some Scene {
        WindowGroup {
            ArrayContentView()
        }
    }
}

struct ArrayContentView: View {
    let numbers = [1, 2, 3, 4, 5, 6]

    var body: some View {
        VStack(spacing: 20) {
            Text("Array Feature Demo")
                .font(.largeTitle)

            Text("Array: [\(numbers.map(String.init).joined(separator: ", "))]")

            Text("Filter Even: [\(ArrayHelper.filterEven(numbers).map(String.init).joined(separator: ", "))]")
                .accessibilityIdentifier("FilterEvenResult")

            Text("Count: \(ArrayHelper.count(numbers))")
                .accessibilityIdentifier("CountResult")

            Text("Sum: \(ArrayHelper.sum(numbers))")
                .accessibilityIdentifier("SumResult")
        }
        .padding()
    }
}
