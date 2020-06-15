//
//  Networking.swift
//  SwiftFrameworkExample
//
//  Created by Gabriel Palhares on 15/06/20.
//

import Foundation

extension SwiftFramework {
    public class Networking {
        /// Responsable for handling  all networking calls
        /// - Warning: Must create before using any public APIs
        public class Manager {
            public init() {}
            
            private let session = URLSession.shared
            
            public func loadData(from url: URL, completion: @escaping (NetworkResult<Data>) -> Void) {
                let task = session.dataTask(with: url) { (data, response, error) in
                    let result = data.map(NetworkResult<Data>.success) ?? .failure(error)
                    completion(result)
                }
                task.resume()
            }
        }
    }
    
    public enum NetworkResult<Value> {
        case success(Value)
        case failure(Error?)
    }
}
