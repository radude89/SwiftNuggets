import Foundation

extension Playground {
    static func runIntegerGenericParametersExample() {
        print("👾 Start SE-0452 - Integer Generic Parameters Playground")
        
        let vec3 = Vector<3, Double>(elements: [1.0, 2.0, 3.0])
        
        print("[Integer Generic Params] - Allocated a vector `vec3`: \(vec3)")
        print("[Integer Generic Params] - vec3[0] = \(vec3[0])")
        
        print("👾 Complete SE-0452 - Integer Generic Parameters Playground")
    }
    
    private struct Vector<let count: Int, Element> {
        var elements: [Element]

        subscript(index: Int) -> Element {
            precondition(index < count)
            return elements[index]
        }
    }
}
