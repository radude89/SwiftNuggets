//
//  ContentView.swift
//  DemoSwift62-part2
//
//  Created by Radu Dan on 21.05.2025.
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
        .onAppear {
            runPlayground()
        }
    }
}

private extension ContentView {
    func runPlayground() {
        let durationInSeconds = Duration.seconds(60)
        print(durationInSeconds)

        let container = Container(data: ["city": "Los Angeles"])
        print(container.name ?? "Unknown") // Prints "Unknown"
        print(container.city ?? "Unknown") // Prints "Los Angeles"

//        container.name(defaultValue: "Unknown")
    }
}

@dynamicMemberLookup
struct Container {
    private var data: [String: String]

    init(data: [String : String]) {
        self.data = data
    }

    subscript(dynamicMember name: String) -> String? {
        data[name]
    }

    subscript(dynamicMember name: String, defaultValue: String = "default") -> String? {
        data[name] ?? defaultValue
    }
}
