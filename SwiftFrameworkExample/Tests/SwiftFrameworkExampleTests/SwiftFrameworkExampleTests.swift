import XCTest
@testable import SwiftFrameworkExample

final class SwiftFrameworkExampleTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(SwiftFrameworkExample().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
