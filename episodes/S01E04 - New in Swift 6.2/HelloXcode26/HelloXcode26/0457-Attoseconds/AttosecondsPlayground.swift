import Foundation

extension Playground {
    static func runAttosecondsPlayground() {
        print("📧 Start SE-0453 - Attoseconds Playground")
        
        let avgOld = averageDuration([
            .seconds(1.1), .seconds(2), .seconds(3.2),
        ])
        let avgNew = averageDurationNew([
            .seconds(1.1), .seconds(2), .seconds(3.2),
        ])
        
        print("[Attoseconds] - (old way) Average of 1.1, 2 and 3.2 seconds: \(avgOld.components.seconds) seconds and \(avgOld.components.attoseconds) attoseconds")
        print("[Attoseconds] - (new way) Average of 1.1, 2 and 3.2 seconds: \(avgNew.components.seconds) seconds and \(avgNew.components.attoseconds) attoseconds")
        print("[Attoseconds] - (new way) Total: \(avgNew.attoseconds) attoseconds")
        
        print("📧 Complete SE-0453 - Attoseconds Playground")
    }
    
    private static let attosecondsInSecond: Int128 = 1_000_000_000_000_000_000
    
    // BEFORE
    private static func averageDuration(_ durations: [Duration]) -> Duration {
        var totalAttoseconds: Int128 = 0
        
        for duration in durations {
            let components = duration.components
            totalAttoseconds += Int128(components.seconds) * attosecondsInSecond +
            Int128(components.attoseconds)
        }
        
        let average = totalAttoseconds / Int128(durations.count)
        let (seconds, attoseconds) = average
            .quotientAndRemainder(dividingBy: attosecondsInSecond)
        
        return Duration(
            secondsComponent: Int64(seconds),
            attosecondsComponent: Int64(attoseconds)
        )
    }
    
    // AFTER
    private static func averageDurationNew(_ durations: [Duration]) -> Duration {
        let totalAttoseconds = durations.reduce(0) { $0 + $1.attoseconds }
        return Duration(attoseconds: totalAttoseconds / Int128(durations.count))
    }
}
