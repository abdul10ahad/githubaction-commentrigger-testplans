import SwiftUI
import MathFeature

@main
struct MathFeatureApp: App {
    var body: some Scene {
        WindowGroup {
            MathContentView()
        }
    }
}

struct MathContentView: View {
    @State private var num1 = 5
    @State private var num2 = 3

    var body: some View {
        VStack(spacing: 20) {
            Text("Math Feature Demo")
                .font(.largeTitle)

            Text("Add: \(num1) + \(num2) = \(MathHelper.add(num1, num2))")
                .accessibilityIdentifier("AddResult")

            Text("Multiply: \(num1) × \(num2) = \(MathHelper.multiply(num1, num2))")
                .accessibilityIdentifier("MultiplyResult")

            Text("Subtract: \(num1) - \(num2) = \(MathHelper.subtract(num1, num2))")
                .accessibilityIdentifier("SubtractResult")

            Text("Divide: \(num1) ÷ \(num2) = \(MathHelper.divide(num1, num2))")
                .accessibilityIdentifier("DivideResult")

            Text("Modulo: \(num1) % \(num2) = \(MathHelper.modulo(num1, num2))")
                .accessibilityIdentifier("ModuloResult")

            Text("Power: \(num1)^\(num2) = \(MathHelper.power(num1, num2))")
                .accessibilityIdentifier("PowerResult")

            Text("Abs: |-5| = \(MathHelper.abs(-5))")
                .accessibilityIdentifier("AbsResult")
        }
        .padding()
    }
}
