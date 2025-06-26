import Foundation

enum Playground {}

func wait(seconds: Int = 1) async {
    try? await Task.sleep(for: .seconds(seconds))
}
