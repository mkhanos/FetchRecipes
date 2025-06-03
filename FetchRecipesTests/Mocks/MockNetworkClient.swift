//
//  MockNetworkClient.swift
//  FetchRecipes
//
//  Created by Momo Khan on 6/3/25.
//

import XCTest

@testable import FetchRecipes

final class MockNetworkClient: Mockable, NetworkClientProtocol {
    func sendRequest<T: Decodable>(endpoint: APIEndpoint, response: T.Type) async throws -> T {
        return try loadJSON(filename: endpoint.mockFile, type: response.self)
    }
}
