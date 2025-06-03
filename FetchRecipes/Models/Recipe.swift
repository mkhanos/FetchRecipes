//
//  Recipe.swift
//  FetchRecipes
//
//  Created by Momo Khan on 6/3/25.
//

struct Recipe: Decodable {
    let cuisine: String
    let name: String
    let photo_url_large: String
    let photo_url_small: String
    let source_url: String?
    let uuid: String
    let youtube_url: String?
}
