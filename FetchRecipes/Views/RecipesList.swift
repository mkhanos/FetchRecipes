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
        ScrollView {
            LazyVStack {
                ForEach(viewModel.recipes, id: \.uuid) { recipe in
                    RecipeRow(recipe: recipe)
                }
            }
            .padding(.horizontal)
        }
        .task {
            await viewModel.loadRecipes()
        }
        .refreshable {
            await viewModel.loadRecipes()
        }
    }
}
