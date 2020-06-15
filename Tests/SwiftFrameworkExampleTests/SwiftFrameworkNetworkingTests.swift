//
//  SwiftFrameworkNetworkingTests.swift
//  SwiftFrameworkExampleTests
//
//  Created by Gabriel Palhares on 15/06/20.
//

import XCTest
@testable import SwiftFrameworkExample

class NetworkSessionMock: NetworkSession {
    
    var data: Data?
    var error: Error?
    
    func get(from url: URL, completion: @escaping (Data?, Error?) -> Void) {
        completion(data, error)
    }
}

final class SwiftFrameworkNetworkingTests: XCTestCase {

    func testLoadDataCall() {
        let manager = SwiftFramework.Networking.Manager()
        
        let session = NetworkSessionMock()
        manager.session = session
        
        let data = Data([0, 1, 0, 1])
        session.data = data
        let url = URL(fileURLWithPath: "url")
        let expectation = XCTestExpectation(description: "Called for data")
        manager.loadData(from: url) { result in
            expectation.fulfill()
            switch result {
            case .success(let returnedData):
                XCTAssertEqual(data, returnedData, "unexpected data received")
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
