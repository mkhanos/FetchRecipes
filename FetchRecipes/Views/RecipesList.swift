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
        Group {
            VStack(alignment: .center) {
                HStack(alignment: .top) {
                    Button("Load Recipes") {
                        Task {
                            await viewModel.loadRecipes()
                        }
                    }
                    Spacer()
                    Button("Load Empty") {
                        Task {
                            await viewModel.loadEmpty()
                        }
                    }
                    Spacer()
                    Button("Load Malformed") {
                        Task {
                            await viewModel.loadMalformed()
                        }
                    }
                }
                Spacer()
                if viewModel.recipes.isEmpty {
                    ScrollView {
                        Text("No recipes available!")
                    }
                } else {
                    ScrollView {
                        LazyVStack {
                            ForEach(viewModel.recipes, id: \.uuid) { recipe in
                                RecipeRow(recipe: recipe)
                            }
                        }
                    }
                }
            }
        }
        .padding(.horizontal)
        .navigationTitle("Recipes")
        .alert("Error", isPresented: $viewModel.showAlert) {
            Button("OK", role: .cancel) {}
        } message: {
            Text(viewModel.errorMessage ?? "Unknown Error")
        }
        .task {
            await viewModel.loadRecipes()
        }
        .refreshable {
            await viewModel.loadRecipes()
        }
    }
}
