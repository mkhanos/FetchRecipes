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
    
    private let recipesService: RecipeService
    
    init(recipesService: RecipeService) {
        self.recipesService = recipesService
        self.recipes = []
        self.errorMessage = nil
        self.isLoading = false
    }
    
    func loadRecipes() async {
        isLoading = true
        do {
            if let recipes = try await recipesService.fetchRecipes() {
                self.recipes = recipes
            }
        } catch {
            errorMessage = "Error loading recipes"
            print(error)
        }
        isLoading = false
    }
    
    func loadEmpty() async {
        isLoading = true
        do {
            if let recipes = try await recipesService.fetchEmpty() {
                self.recipes = recipes
            }
        } catch {
            errorMessage = "Error loading recipes"
            print(error)
        }
        isLoading = false
    }
    
    func loadMalformed() async {
        isLoading = true
        do {
            if let recipes = try await recipesService.fetchMalformed() {
                self.recipes = recipes
            }
        } catch {
            errorMessage = "Error loading recipes"
            print(error)
        }
        isLoading = false
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
