import SwiftUI

struct ContentView: View {
    let rank = [
      "Player 1",
      "Player 2",
      "Player 3",
      "Player 4",
      "Player 4"
    ]

    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
        .onAppear {
            print("We launched 🚀")
            let string = "👋🏼 Helló"

            print(string.startIndex) // ⟹ Index(_rawBits: 15)
            print(string.endIndex) // ⟹ Index(_rawBits: 983047)
            print(string.utf16.index(after: string.startIndex)) // ⟹ Index(_rawBits: 16388)
            print(string.firstRange(of: "ell")!) // ⟹ Index(_rawBits: 655623)..<Index(_rawBits: 852487)
        }
    }

    private func myMethod(input: Int) {}
}

// NetworkKit framework/module
public struct APIResponse {
    public let data: Data

    public init(data: Data) {
        self.data = data
    }
}

extension Data {
    public func decode() -> APIResponse {
        APIResponse(data: Data())
    }
}

// LocalDataKit framework/module
public struct CachedData {
    public let data: Data
}

extension Data {
    public func decode() -> CachedData? {
        CachedData(data: Data())
    }
}

// Main App

// import NetworkKit
// import LocalDataKit

enum ColorN {
    case _50
    case _20
}

struct Vector3<T> {
    var x: T?
    var y: T?
    var z: T?

    subscript(index: Int) -> T? {
        get {
            switch index {
            case 0: x
            case 1: y
            case 2: z
            default: nil
            }
        } set {
            switch index {
            case 0: x = newValue
            case 1: y = newValue
            case 2: z = newValue
            default: return
            }
        }
    }
}

struct FixedBuffer<T> {
    private var storage: [T]
    private let maxCapacity = 10

    init() {
        self.storage = []
    }

    mutating func append(_ element: T) -> Bool {
        guard storage.count < maxCapacity else { return false }
        storage.append(element)
        return true
    }
}

//// New proposal
//
//struct Vector<let count: Int, T> {
//    ///
//}

struct Person: ~Copyable {
    var name: String
}

func doSomething() {
    let person = Person(name: "John")
//    let anotherPerson = person
//    let name = anotherPerson.name
//    print(anotherPerson.name)
    print(person.name)
}
