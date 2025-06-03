//
//  FetchRecipesApp.swift
//  FetchRecipes
//
//  Created by Momo Khan on 6/3/25.
//

import SwiftUI

@main
struct FetchRecipesApp: App {
    let networkClient: NetworkClientProtocol = NetworkClient()
    let recipeService: RecipeServiceProtocol
    let recipeViewModel: RecipeViewModel
    
    init() {
        recipeService = RecipeService(networkClient: networkClient)
        recipeViewModel = RecipeViewModel(recipesService: recipeService)
        
    }
    var body: some Scene {
        WindowGroup {
            RecipesList(viewModel: recipeViewModel)
        }
    }
}
