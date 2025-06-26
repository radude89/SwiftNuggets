import Foundation

extension Playground {
    static func runInlineArrayPlayground() {
        print("🎃 Start SE-0453 - Inline Array Playground")
        
        let point: InlineArray = [1.0, 2.0, 3.0]
        // Same as: InlineArray<3, Double>
        
        print("[Inline Array] - Point[0]: \(point[0])")
        
        print("🎃 Complete SE-0453 - Inline Array Playground")
    }
}
