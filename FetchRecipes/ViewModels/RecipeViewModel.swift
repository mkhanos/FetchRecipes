//
//  RecipeViewModel.swift
//  FetchRecipes
//
//  Created by Momo Khan on 6/3/25.
//

import Foundation
import SwiftUI

@MainActor
final class RecipeViewModel: ObservableObject {
    @Published var recipes: [Recipe]
    @Published var errorMessage: String?
    @Published var isLoading: Bool
    
    private let recipeService: RecipeServiceProtocol
    
    init(recipesService: RecipeServiceProtocol) {
        self.recipeService = recipesService
        self.recipes = []
        self.errorMessage = nil
        self.isLoading = false
    }
    
    func loadRecipes() async {
        await load(using: recipeService.fetchRecipes)
    }
    
    func loadEmpty() async {
        await load(using: recipeService.fetchEmpty)
    }
    
    func loadMalformed() async {
        await load(using: recipeService.fetchMalformed)
    }
    
    private func load(using serviceEndpoint: @escaping () async throws -> [Recipe]?) async {
        isLoading = true
        errorMessage = nil
        defer { isLoading = false }
        
        do {
            if let recipes = try await serviceEndpoint() {
                self.recipes = recipes
            } else {
                recipes = []
            }
        } catch let error as NetworkError {
            recipes = []
            self.errorMessage = error.localizedDescription
        } catch {
            self.errorMessage = "Unknown error"
            recipes = []
        }
    }
}
