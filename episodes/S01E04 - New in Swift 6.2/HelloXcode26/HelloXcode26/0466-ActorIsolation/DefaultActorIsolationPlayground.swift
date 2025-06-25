import Foundation

extension Playground {
    static func runDefaultActorIsolationPlayground() {
        print("🐙 Start SE-0466 - Default Actor Isolation Playground")
        
        sayHello()
        
        let controller = UIController()
        
        controller.startLoading()
        controller.stopLoading()
        
        print("[Default Actor Isolation] - Is Loading \(controller.isLoading)")
    }
    
    private nonisolated static func sayHello() {
        print("[Default Actor Isolation] - Hello!")
    }
    
    @MainActor
    private class UIController {
        var isLoading = false // Protected by MainActor

        // nonisolated won't work
        func startLoading() {
            isLoading = true // Safe - always on main thread
        }
        
        nonisolated func stopLoading() {
            Task { @MainActor in
                isLoading = false
                print("[Default Actor Isolation] - Is Loading \(isLoading)")
                print("🐙 Complete SE-0466 - Default Actor Isolation Playground")
            }
        }
    }

}
