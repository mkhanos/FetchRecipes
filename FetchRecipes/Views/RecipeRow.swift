//
//  RecipeRow.swift
//  FetchRecipes
//
//  Created by Momo Khan on 6/3/25.
//

import SwiftUI

struct RecipeRow: View {
    var recipe: Recipe
    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading) {
                Text(recipe.name)
                    .font(.headline)
                Text(recipe.cuisine)
                    .font(.subheadline)
            }
            Spacer()
            CachedImageView(url: URL(string: recipe.photo_url_small)!, uuid: recipe.uuid)
                .frame(width: 100, height: 100)
        }
        .aspectRatio(16.0 / 9.0 , contentMode: .fit)
    }
}
