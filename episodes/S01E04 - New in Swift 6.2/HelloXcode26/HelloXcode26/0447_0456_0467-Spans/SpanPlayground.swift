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
        
        // Not working with current Xcode 26 beta1 Swift toolchain
        // let mutableSpan = numbers.mutableSpan
        //
        // for i in 0..<span.count {
        //    span[i] *= 2  // Direct mutation through span
        // }
        //
        // End the exclusive access
        // _ = consume span
     
        print("🚗 Complete SE-0447, SE-0456 SE-0467 - Spans Playground")
    }
}
