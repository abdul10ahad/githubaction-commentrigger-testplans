//
//  ContentView.swift
//  manual_Trigger
//
//  Created by Abdul Ahad on 07.11.25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
            Text("Testing comment-triggered workflow")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
