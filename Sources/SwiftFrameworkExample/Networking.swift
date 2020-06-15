//
//  Networking.swift
//  SwiftFrameworkExample
//
//  Created by Gabriel Palhares on 15/06/20.
//

import Foundation

protocol NetworkSession {
    func get(from url: URL, completion: @escaping (Data?, Error?) -> Void)
}

extension URLSession: NetworkSession {
    func get(from url: URL, completion: @escaping (Data?, Error?) -> Void) {
        let task = dataTask(with: url) { (data, _, error) in
            completion(data, error)
        }
        task.resume()
    }
}

extension SwiftFramework {
    public class Networking {
        /// Responsable for handling  all networking calls
        /// - Warning: Must create before using any public APIs
        public class Manager {
            public init() {}
            
            internal var session: NetworkSession = URLSession.shared
            
            /// Calls to the live internet to retrieve Data from a specific location
            /// - Parameters:
            ///   - url: The location you wish to fetch data from
            ///   - completion: Result object that represents the status of the request
            public func loadData(from url: URL, completion: @escaping (NetworkResult<Data>) -> Void) {
                session.get(from: url) { (data, error) in
                    let result = data.map(NetworkResult<Data>.success) ?? .failure(error)
                    completion(result)
                }
            }
        }
    }
    
    public enum NetworkResult<Value> {
        case success(Value)
        case failure(Error?)
    }
}
