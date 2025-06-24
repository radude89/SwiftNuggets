import Foundation

extension Playground {
    private enum ColorShade {
        case `50`    // Light shade
        case `100`
        case `200`
        case `900`   // Dark shade
    }

    private static func `when user logs in with valid credentials then success`() {
        // Run your test
        print("[RawIdentifier] - Running test..." )
    }
    
    static func runRawIdentifiersExample() {
        print("⚽️ Start SE-0451 - Raw Identifiers Playground")
        
        let lightGray = ColorShade.`50`
        print(lightGray)
        `when user logs in with valid credentials then success`()
        
        print("⚽️ Complete SE-0451 - Raw Identifiers Playground")
    }
}
