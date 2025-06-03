//
//  ImageCacheTests.swift
//  FetchRecipes
//
//  Created by Momo Khan on 6/3/25.
//

import XCTest
@testable import FetchRecipes

final class ImageCacheTests: XCTestCase {
    var testDirectory: URL!
    var cache: ImageCache!
    
    override func setUp() {
        super.setUp()
        testDirectory = FileManager.default.temporaryDirectory.appendingPathComponent("ImageCacheTest")
        cache = ImageCache(customDirectory: testDirectory)
    }
    
    override func tearDownWithError() throws {
        try FileManager.default.removeItem(at: testDirectory)
        super.tearDown()
    }
    
    func testCachePath() async {
        let testPath = "testPath"
        let expectedPath = testDirectory.appendingPathComponent("testPath.jpg")
        let actualPath = cache.cachePath(uuid: testPath)
        XCTAssertEqual(expectedPath, actualPath)
    }
    
    func testImageSaveAndLoad() async {
        let testUUID = "uuid"
        let image = UIImage(systemName: "dog.fill")!.withTintColor(.orange)
        await cache.save(image: image, uuid: testUUID)
        let loadedImage = await cache.load(uuid: testUUID)!
        
        XCTAssertNotNil(loadedImage)
    }
    
    func testLoadingUncachedImageReturnsNil() async {
        let uuid = "uuid"
        let loadedImage = await cache.load(uuid: uuid)
        XCTAssertNil(loadedImage)
    }
}
