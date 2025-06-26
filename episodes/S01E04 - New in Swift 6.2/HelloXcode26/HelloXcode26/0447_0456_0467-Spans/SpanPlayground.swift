import Foundation

extension Playground {
    static func runSpanExample() {
        print("🚗 Start SE-0447, SE-0456 SE-0467 - Spans Playground")

        let numbers = [10, 20, 30, 40, 50, 60, 70]
        
        // Old way
        let result = unsafe numbers.withUnsafeBufferPointer { buffer in
            unsafe buffer.map(String.init).joined(separator: ", ")
        }
        print("[Span] - With unsafe buffer pointer \(result)")
        
        // New way
        let span = numbers.span
        print("[Span] - Accessing first element with span \(span[0])")
        
        let rawSpan = span.bytes
        print("[Span] - RawSpan byteCount \(rawSpan.byteCount)") // 7 elements x 8 bytes = 56 bytes
        
        // Mutable span
        var bytes: [UInt8] = [1, 2, 3, 4, 5]
        var data = Data(bytes)
        var mutableSpan = data.mutableSpan

        for i in 0..<mutableSpan.count {
            mutableSpan[i] *= 2
        }

        _ = consume mutableSpan
        bytes = Array(data)  // Convert back
        print("[Span] - MutableSpan bytes \(bytes)")  // [2, 4, 6, 8, 10]
     
        print("🚗 Complete SE-0447, SE-0456 SE-0467 - Spans Playground")
    }
}
