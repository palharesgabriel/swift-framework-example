import XCTest
@testable import SwiftFrameworkExample

final class SwiftFrameworkExampleTests: XCTestCase {
    
    func testColorRedEqual() {
        let color = SwiftFrameworkExample.color(from: "FF0000")
        XCTAssertEqual(color, .red)
    }
    
    func testFrameworkColorsAreEqual() {
        let color = SwiftFrameworkExample.color(from: "006736")
        XCTAssertEqual(color, SwiftFrameworkExample.frameworkColor)
    }
    
    func testSecondaryFrameworkColorAreEqual() {
        let color = SwiftFrameworkExample.color(from: "FCFFFD")
        XCTAssertEqual(color, SwiftFrameworkExample.secondaryColor)
    }

    static var allTests = [
        ("testColorRedEqual", testColorRedEqual),
        ("testFrameworkColorsAreEqual", testFrameworkColorsAreEqual),
        ("testSecondaryFrameworkColorAreEqual", testSecondaryFrameworkColorAreEqual)
    ]
}
