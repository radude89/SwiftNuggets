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
        
        // https://github.com/swiftlang/swift-evolution/blob/main/proposals/0457-duration-attosecond-represenation.md
        Playground.runAttosecondsPlayground()

        // https://github.com/swiftlang/swift-evolution/blob/main/proposals/0458-strict-memory-safety.md
        Playground.runStrictMemoryPlayground()
        
        // https://github.com/swiftlang/swift-evolution/blob/main/proposals/0461-async-function-isolation.md
        Playground.runNonIsolatedAsyncPlayground()
        
        // https://github.com/swiftlang/swift-evolution/blob/main/proposals/0462-task-priority-escalation-apis.md
        Playground.runTaskPriorityEscalationPlayground()
        
        // https://github.com/swiftlang/swift-evolution/blob/main/proposals/0466-control-default-actor-isolation.md
        Playground.runDefaultActorIsolationPlayground()
    }
}
