import Foundation

extension Playground {
    static func runNonIsolatedAsyncPlayground() {
        print("🚴‍♂️ Start SE-0461 - Nonisolated async functions on the caller's actor by default Playground")
        
        Task {
            let anActor = MyActor()
            await anActor.useObject()
            await anActor.processData()
        }
        
        print("🚴‍♂️ Complete SE-0461 - Nonisolated async functions on the caller's actor by default Playground")
    }
    
    private final class MyClass {
        var value: Int = 0

        func performAsync() async {
            // Before   - This is nonisolated async - always switches off actor
            // After    - Safe! Runs on caller's actor
            self.value += 1  // Potential data race!
        }

        func performSync() {
            // Before & After - This is nonisolated sync - stays on caller's actor
            self.value += 1  // Safe on actor
        }
        
        @concurrent  // Explicitly switches off current actor
        func fetchData() async -> Data {
            // This runs on a background actor/thread
            // Safe to do blocking I/O here
            return Data()
        }
    }

    private actor MyActor {
        let myClass = MyClass()

        func useObject() async {
            // Before   - This would cause a data race warning! Switches off actor
            // After    - Safe
            await myClass.performAsync()
            await myClass.performSync()  // Stays on actor
        }
        
        func processData() async {
            // This switches to background for network call
            _ = await myClass.fetchData()
            
            // Then continues back on DataProcessor actor
        }
    }
}
