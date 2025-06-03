//
//  RecipeEndpoint.swift
//  FetchRecipes
//
//  Created by Momo Khan on 6/3/25.
//

enum RecipeEndpoints: APIEndpoint {
    case recipes
    case malformed
    case empty
    
    var path: String {
        switch self {
        case .recipes:
            return "/recipes.json"
        case .malformed:
            return "/recipes-malformed.json"
        case .empty:
            return "/recipes-empty.json"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .recipes,
                .malformed,
                .empty:
            return .get
        }
    }
    
    var mockFile: String {
        switch self {
        case .recipes:
            return "recipes"
        case .malformed:
            return "recipes-malformed"
        case .empty:
            return "recipes-empty"
        }
    }
}
