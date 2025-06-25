import Foundation

extension Playground {
    static func runTaskPriorityEscalationPlayground() {
        print("🧩 Start SE-0462 - Task Priority Escalation APIs Playground")

        let backgroundTask = Task(priority: .background) {
            print("[Task Escalation] - Current priority: \(Task.currentPriority)") // .background
            await withTaskPriorityEscalationHandler {
                await loadData()
                print("[Task Escalation] - Escalated priority: \(Task.currentPriority)")
                try? await Task.sleep(for: .seconds(3))
                print("🧩 Complete SE-0462 - Task Priority Escalation APIs Playground")
            } onPriorityEscalated: { oldPriority, newPriority in
                print("[Task Escalation] - Old: \(oldPriority)")
                print("[Task Escalation] - New: \(newPriority)")
            }
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            // Later, user requests the data urgently:
            print("[Task Escalation] - Escalate priority")
            backgroundTask.escalatePriority(to: .low)
        }
    }
    
    private static func loadData() async {
        print("[Task Escalation] - Loading data...")
        try? await Task.sleep(for: .seconds(2))
        print("[Task Escalation] - Completed ✅")
    }
}
