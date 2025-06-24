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
            Text("Swift 6.2 - playground")
        }
        .padding()
        .onAppear(perform: runPlaygroundOnAppear)
    }
    
    private func runPlaygroundOnAppear() {
        // https://github.com/swiftlang/swift-evolution/blob/main/proposals/0371-isolated-synchronous-deinit.md
        Playground.runIsolatedDeinitExample()
        
        // https://github.com/swiftlang/swift-evolution/blob/main/proposals/0446-non-escapable.md
        Playground.runNotEscapableExample()
        
        // https://github.com/swiftlang/swift-evolution/blob/main/proposals/0447-span-access-shared-contiguous-storage.md
        // https://github.com/swiftlang/swift-evolution/blob/main/proposals/0456-stdlib-span-properties.md
        // https://github.com/swiftlang/swift-evolution/blob/main/proposals/0467-MutableSpan.md
        Playground.runSpanExample()
        
        // https://github.com/swiftlang/swift-evolution/blob/main/proposals/0451-escaped-identifiers.md
        Playground.runRawIdentifiersExample()
        
        // https://github.com/swiftlang/swift-evolution/blob/main/proposals/0452-integer-generic-parameters.md
        Playground.runIntegerGenericParametersExample()
        
        // https://github.com/swiftlang/swift-evolution/blob/main/proposals/0453-vector.md
        Playground.runInlineArrayPlayground()
    }
}

#Preview {
    ContentView()
}
