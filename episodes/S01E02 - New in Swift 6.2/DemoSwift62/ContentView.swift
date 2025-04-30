//
//  ContentView.swift
//  DemoSwift62
//
//  Created by Radu Dan on 28.04.2025.
//

import SwiftUI

struct Greeting: ~Copyable {
    var sayHelloVar: String
}

struct GreetingNonEscapable: ~Escapable {
}

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }

    func sayHello() {
        let greeting = Greeting(sayHelloVar: "Hello!")
        var anotherGreeting = greeting
        print(anotherGreeting.sayHelloVar)
        // print(greeting.sayHelloVar) -> ERROR
    }
}

#Preview {
    ContentView()
}
