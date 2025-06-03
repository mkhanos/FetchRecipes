//
//  Mockable.swift
//  FetchRecipes
//
//  Created by Momo Khan on 6/3/25.
//

import Foundation

protocol Mockable: AnyObject {
    var bundle: Bundle { get }
    func loadJSON<T: Decodable>(filename: String, type: T.Type) throws -> T
}

extension Mockable {
    var bundle: Bundle {
        return Bundle(for: type(of: self))
    }
    
    func loadJSON<T: Decodable>(filename: String, type: T.Type) throws -> T {
        guard let path = bundle.url(forResource: filename, withExtension: "json") else {
            fatalError("Failed to load bundle")
        }
        
        let data = try Data(contentsOf: path)
        let decodedObject = try JSONDecoder().decode(type, from: data)
        
        return decodedObject
    }
}
