//
//  APIEndpoint.swift
//  FetchRecipes
//
//  Created by Momo Khan on 6/3/25.
//

import Foundation

protocol APIEndpoint {
    var baseURL: String { get }
    var scheme: String { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var mockFile: String { get }
}

extension APIEndpoint {
    var baseURL: String {
        return "d3jbb8n5wk0qxi.cloudfront.net"
    }
    
    var scheme: String {
        return "https"
    }
    
    func buildRequest() throws -> URLRequest {
        var components = URLComponents()
        components.scheme = scheme
        components.host = baseURL
        components.path = path
        
        guard let url = components.url else {
            throw NetworkError.badURL
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        
        return request
    }
}
