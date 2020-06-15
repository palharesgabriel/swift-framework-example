//
//  SwiftFrameworkNetworkingTests.swift
//  SwiftFrameworkExampleTests
//
//  Created by Gabriel Palhares on 15/06/20.
//

import XCTest
@testable import SwiftFrameworkExample

final class SwiftFrameworkNetworkingTests: XCTestCase {

    func testLoadDataCall() {
        let manager = SwiftFramework.Networking.Manager()
        let expectation = XCTestExpectation(description: "Called for data")
        guard let url = URL(string: "https://raywenderlich.com") else {
            return XCTFail("Could not create URL properly")
        }
        manager.loadData(from: url) { result in
            expectation.fulfill()
            switch result {
            case .success(let returnedData):
                XCTAssertNil(returnedData, "Data is nil")
            case .failure(let error):
                XCTFail(error?.localizedDescription ?? "error on forming Error object")
            }
        }
        wait(for: [expectation], timeout: 5)
    }
    
    static var allTests = [
        ("testLoadDataCall", testLoadDataCall)
    ]

}
