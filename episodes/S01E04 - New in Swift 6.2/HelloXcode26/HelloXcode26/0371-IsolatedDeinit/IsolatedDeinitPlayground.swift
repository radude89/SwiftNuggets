import Foundation

class Friend {
    var state = 0
}

class Person {
    let friend: Friend
    let name = UUID().uuidString
    
    init() {
        print("Called init for \(name)")
        friend = Friend()
    }

    init(otherPerson: Person) {
        print("Called init for \(name)")
        friend = otherPerson.friend
    }
    
    // (1) deinit --> isolated
    isolated deinit {
        print("Called deinit for \(name)")
        friend.state += 1
    }
}

extension Playground {
    static func runIsolatedDeinitExample() {
        print("🛸 Start SE-0371 - Isolated Deinit Playground")
        var person: Person? = Person()
        if let person {
            _ = Person(otherPerson: person)
            // Calls deinit
        }
        person = nil
        // Calls deinit
        print("🛸 Complete SE-0371 - Isolated Deinit Playground")
    }
}
