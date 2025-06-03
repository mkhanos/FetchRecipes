//
//  RecipesList.swift
//  FetchRecipes
//
//  Created by Momo Khan on 6/3/25.
//

import SwiftUI

struct RecipesList: View {
    
    @StateObject var viewModel: RecipeViewModel
    
    init(viewModel: RecipeViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    var body: some View {
        List {
            ForEach(viewModel.recipes, id: \.uuid) { recipe in
                RecipeRow(recipe: recipe)
            }
        }
        .task {
            await viewModel.loadRecipes()
        }
    }
}
