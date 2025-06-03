//
//  CachedImageView.swift
//  FetchRecipes
//
//  Created by Momo Khan on 6/3/25.
//

import SwiftUI

struct CachedImageView: View {
    @StateObject private var imageLoader = ImageLoader()
    
    let url: URL
    let uuid: String
    
    var body: some View {
        Group {
            if let image = imageLoader.image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
            } else {
                ProgressView()
            }
        }
        .task {
            await imageLoader.load(url: url, uuid: uuid)
        }
    }
}
