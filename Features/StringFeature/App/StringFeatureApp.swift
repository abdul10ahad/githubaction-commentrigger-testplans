import SwiftUI
import StringFeature

@main
struct StringFeatureApp: App {
    var body: some Scene {
        WindowGroup {
            StringContentView()
        }
    }
}

struct StringContentView: View {
    let str1 = "Hello"
    let str2 = "World"

    var body: some View {
        VStack(spacing: 20) {
            Text("String Feature Demo")
                .font(.largeTitle)

            Text("Concatenate: \(StringHelper.concatenate(str1, str2))")
                .accessibilityIdentifier("ConcatenateResult")

            Text("Length of '\(str1)': \(StringHelper.length(str1))")
                .accessibilityIdentifier("LengthResult")
        }
        .padding()
    }
}
