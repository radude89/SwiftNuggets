import Foundation

enum NotEscapable: ~Escapable {
    case value
    case secondValue
    
    var formatted: String {
        switch self {
        case .value:
            return "First value"
        case .secondValue:
            return "Second value"
        }
    }
    
    // ERROR: A method cannot return a ~Escapable result
//    func escapeSecondValue() -> Self {
//        .secondValue
//    }
}

extension Playground {
    static func runNotEscapableExample() {
        print("🐈 Start SE-0446 - Nonescapable Types Playground")
        
        let value: NotEscapable = .value
        nonBorrowingFunc(value)
        print(value.formatted)
        
        print("🐈 Complete SE-0446 - Nonescapable Types Playground")
    }
    
    private static func nonBorrowingFunc(_ value: NotEscapable) {
        // do something with it
    }
}
