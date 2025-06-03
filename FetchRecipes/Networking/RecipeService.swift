//
//  RecipeService.swift
//  FetchRecipes
//
//  Created by Momo Khan on 6/3/25.
//

import Foundation

final class RecipeService {
    private var networkClient: NetworkClientProtocol
    
    init(networkClient: NetworkClientProtocol) {
        self.networkClient = networkClient
    }
    
    func fetchRecipes() async throws -> [Recipe]? {
        let response = try await networkClient.sendRequest(endpoint: RecipeEndpoints.recipes, response: RecipeResponse.self)
        return response.recipes
    }
    
    func fetchEmpty() async throws -> [Recipe]? {
        let response = try await networkClient.sendRequest(endpoint: RecipeEndpoints.empty, response: RecipeResponse.self)
        return response.recipes
    }
    
    func fetchMalformed() async throws -> [Recipe]? {
        let response = try await networkClient.sendRequest(endpoint: RecipeEndpoints.malformed, response: RecipeResponse.self)
        return response.recipes
    }
}
