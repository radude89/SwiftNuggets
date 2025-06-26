import Foundation

extension Playground {
    static func runStrictMemoryPlayground() {
        print("🚴‍♂️ Start SE-0458 - Strict Memory Safety Checking Playground")
        
        let array = [10, 20, 30, 40]
        unsafe array.withUnsafeBufferPointer { buffer in
            let result = unsafe Playground.sumIntBuffer(buffer, array.count)
            print("[Strict Memory] - Sums of 10, 20, 30, 40 with unsafe buffer is \(result)")
        }

        let safeArray = Playground.SafeArray(array: array)
        print("[Strict Memory] - Accessing second element of safe array, safeArray[2] = \(safeArray[2] ?? -1)")
        
        print("🚴‍♂️ Complete SE-0458 - Strict Memory Safety Checking Playground")
    }
    
    @unsafe
    private static func sumIntBuffer(_ address: UnsafeBufferPointer<Int>?, _ count: Int) -> Int {
        guard let address = unsafe address else { return 0 }
        var sum = 0
        for i in 0..<count {
            unsafe sum += address[i]  // Still unsafe, but explicitly marked
        }
        return sum
    }

    @safe  // Explicitly marked as safe despite using unsafe internals
    private struct SafeArray {
        private var buffer: UnsafeBufferPointer<Int>?
        
        init(array: [Int]) {
            unsafe buffer = nil
            unsafe array.withUnsafeBufferPointer { buffer in
                unsafe self.buffer = buffer
            }
        }
        
        subscript(index: Int) -> Int? {
            unsafe buffer?[index]
        }
    }
}
