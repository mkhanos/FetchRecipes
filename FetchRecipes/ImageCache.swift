//
//  ImageCache.swift
//  FetchRecipes
//
//  Created by Momo Khan on 6/3/25.
//


import UIKit

actor ImageCache {
    static let shared = ImageCache()
    
    private let cacheDirectory: URL
    
    init(customDirectory: URL? = nil) {
        if let customDirectory = customDirectory {
            self.cacheDirectory = customDirectory
        }
        else {
            let cachesURL = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask)[0]
            self.cacheDirectory = cachesURL.appendingPathComponent("ImageCache", isDirectory: true)
        }
    
        do {
            try FileManager.default.createDirectory(at: self.cacheDirectory, withIntermediateDirectories: true)
            print("Successfully created directory")
        } catch {
            print("Failed to create directory \(error)")
        }
    }
    
    func cachePath(uuid: String) -> URL {
        let fileName = uuid + ".jpg"
        let path = cacheDirectory.appendingPathComponent(fileName)
        return path
    }
    
    func load(uuid: String) -> UIImage? {
        do {
            let data = try Data(contentsOf: cachePath(uuid: uuid))
            print("Successfully loaded file: \(uuid)")
            return UIImage(data: data)
        } catch {
            print("Failed to load from disk \(error)")
            return nil
        }
    }
    
    func save(image: UIImage, uuid: String) async {
        guard let data = image.jpegData(compressionQuality: 1.0) else {
            print("Problem generating data")
            return
        }
        do {
            try data.write(to: cachePath(uuid: uuid))
            print("Successfully saved filed \(uuid)")
        } catch {
            print("Failed to write to disk \(error)")
        }
    }
}
