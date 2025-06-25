import Foundation

extension Playground {
    static func runAsyncStreamHashablePlayground() {
        print("🦞 Start SE-0468 - Async Stream Hashable Playground")
        
        let notificationCenter = CustomNotificationCenter()
        let monitor = NotificationMonitor(notificationCenter: notificationCenter)
        monitor.createMultipleSubscribers()
        
        Task {
            await wait(seconds: 1)
            notificationCenter.broadcast("Broadcast important message! 👾")
            
            await wait(seconds: 1)
            monitor.cleanup()
            
            print("🦞 Complete SE-0468 - Async Stream Hashable Playground")
        }
    }
    
    private final class CustomNotificationCenter {
        // Direct usage without wrapper classes
        private var continuations: Set<AsyncStream<String>.Continuation> = []

        func subscribe() -> AsyncStream<String> {
            AsyncStream { continuation in
                // Can directly insert continuation into Set
                continuations.insert(continuation)

                continuation.onTermination = { _ in
                    Task { @MainActor in
                        // Can directly remove continuation from Set
                        self.continuations.remove(continuation)
                    }
                }
            }
        }

        func broadcast(_ message: String) {
            // Iterate over continuations directly
            for continuation in continuations {
                continuation.yield(message)
            }
        }
    }

    private final class NotificationMonitor {
        private let notificationCenter: CustomNotificationCenter
        private var tasks: [Task<Void, Never>]
        
        init(notificationCenter: CustomNotificationCenter) {
            self.notificationCenter = notificationCenter
            self.tasks = []
        }

        func createMultipleSubscribers() {
            for i in 1...3 {
                let task = Task {
                    let stream = notificationCenter.subscribe()
                    
                    for await unsafe message in stream {
                        print("[Async Stream] - Subscriber \(i) received: \(message)")
                    }
                }
                tasks.append(task)
            }
        }

        func cleanup() {
            tasks.forEach { $0.cancel() }
            tasks.removeAll()
            print("[Async Stream] - Cleanup")
        }
    }
}
