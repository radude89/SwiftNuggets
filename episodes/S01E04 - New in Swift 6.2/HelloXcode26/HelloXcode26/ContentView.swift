//
//  ContentView.swift
//  HelloXcode26
//
//  Created by Radu Dan on 24.06.2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
        .onAppear(perform: runPlaygroundOnAppear)
    }
    
    private func runPlaygroundOnAppear() {
        // https://github.com/swiftlang/swift-evolution/blob/main/proposals/0371-isolated-synchronous-deinit.md
        executeIsolatedDeinitPlayground()
        
        // https://github.com/swiftlang/swift-evolution/blob/main/proposals/0446-non-escapable.md
        executeNotEscapablePlayground()
    }
}

#Preview {
    ContentView()
}
