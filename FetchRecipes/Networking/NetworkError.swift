//
//  NetworkError.swift
//  FetchRecipes
//
//  Created by Momo Khan on 6/3/25.
//

import Foundation

enum NetworkError: Error {
    case badURL
    case decoding(String)
    case unknown(String)
    case badRequest
    case forbidden
    case notFound
    case serverError
    case unknownStatus(Int)
    case invalidResponse
}
