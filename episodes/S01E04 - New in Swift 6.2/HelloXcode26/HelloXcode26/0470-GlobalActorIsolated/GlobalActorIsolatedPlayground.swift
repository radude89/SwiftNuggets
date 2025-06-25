import Foundation

extension Playground {
    static func runGlobalActorIsolatedPlayground() {
        print("🦢 Start SE-0470 - Global-actor isolated conformance Playground")
        
        let userViewModel = UserViewModel()
        
        print("[Global-actor isolated] - Email is \(userViewModel.email)")
        
        print("🦢 Complete SE-0468 - Global-actor isolated conformance Playground")
    }
}

private protocol EmailSending {
    var email: String { get set }
}

// @MainActor --> already added
private final class UserViewModel: EmailSending {
    var email = "test@email.com"
}

// Before: ❌ Main actor-isolated property 'email' cannot be used to satisfy nonisoldated requirement from protocol `EmailSending`
extension UserViewModel: @MainActor Equatable {
    static func == (lhs: UserViewModel, rhs: UserViewModel) -> Bool {
        lhs.email == rhs.email
    }
}
