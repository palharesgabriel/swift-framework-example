import XCTest
@testable import SwiftFrameworkExample

final class SwiftFrameworkColorTests: XCTestCase {
    
    func testColorRedEqual() {
        let color = SwiftFramework.Color.fromHexString("FF0000")
        XCTAssertEqual(color, .red)
    }
    
    func testFrameworkColorsAreEqual() {
        let color = SwiftFramework.Color.fromHexString("006736")
        XCTAssertEqual(color, SwiftFramework.Color.frameworkColor)
    }
    
    func testSecondaryFrameworkColorAreEqual() {
        let color = SwiftFramework.Color.fromHexString("FCFFFD")
        XCTAssertEqual(color, SwiftFramework.Color.secondaryColor)
    }

    static var allTests = [
        ("testColorRedEqual", testColorRedEqual),
        ("testFrameworkColorsAreEqual", testFrameworkColorsAreEqual),
        ("testSecondaryFrameworkColorAreEqual", testSecondaryFrameworkColorAreEqual)
    ]
}
