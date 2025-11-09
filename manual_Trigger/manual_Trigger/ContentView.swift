//
//  ContentView.swift
//  manual_Trigger
//
//  Created by Abdul Ahad on 07.11.25.
//

import SwiftUI
import MathFeature
import StringFeature
import ArrayFeature

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
            Text("Testing comment-triggered workflow")
            Text("With test plans!")

            // Using feature modules
            Text("Math: 2 + 4 = \(MathHelper.add(2, 4))")
            Text("String: \(StringHelper.concatenate("Hello", "World"))")
            Text("Array count: \(ArrayHelper.count([1, 2, 3, 4, 5]))")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
