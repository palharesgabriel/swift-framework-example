import XCTest
@testable import SwiftFrameworkExample

final class SwiftFrameworkExampleTests: XCTestCase {
    
    func testColorRedEqual() {
        let color = SwiftFrameworkExample.color(from: "FF0000")
        XCTAssertEqual(color, .red)
    }

    static var allTests = [
        ("testColorRedEqual", testColorRedEqual),
    ]
}
