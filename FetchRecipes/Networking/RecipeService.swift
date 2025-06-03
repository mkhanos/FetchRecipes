//
//  RecipeService.swift
//  FetchRecipes
//
//  Created by Momo Khan on 6/3/25.
//

import Foundation

protocol RecipeServiceProtocol {
    func fetchRecipes() async throws -> [Recipe]?
    func fetchEmpty() async throws -> [Recipe]?
    func fetchMalformed() async throws -> [Recipe]?
}

final class RecipeService: RecipeServiceProtocol {
    private var networkClient: NetworkClientProtocol
    
    init(networkClient: NetworkClientProtocol) {
        self.networkClient = networkClient
    }
    
    func fetchRecipes() async throws -> [Recipe]? {
        let response = try await networkClient.sendRequest(endpoint: RecipeEndpoint.recipes, response: RecipeResponse.self)
        return response.recipes
    }
    
    func fetchEmpty() async throws -> [Recipe]? {
        let response = try await networkClient.sendRequest(endpoint: RecipeEndpoint.empty, response: RecipeResponse.self)
        return response.recipes
    }
    
    func fetchMalformed() async throws -> [Recipe]? {
        let response = try await networkClient.sendRequest(endpoint: RecipeEndpoint.malformed, response: RecipeResponse.self)
        return response.recipes
    }
}
