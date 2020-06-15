import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(SwiftFrameworkColorTests.allTests),
        testCase(SwiftFrameworkNetworkingTests.allTests)
    ]
}
#endif
