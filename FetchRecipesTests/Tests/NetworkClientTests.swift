//
//  NetworkClientTests.swift
//  FetchRecipes
//
//  Created by Momo Khan on 6/3/25.
//

import XCTest
@testable import FetchRecipes

final class NetworkClientTests: XCTestCase {
    var mockClient: MockNetworkClient!
    
    override func setUp() {
        super.setUp()
        mockClient = MockNetworkClient()
    }
    
    func testSuccessfulRecipesResponse() async {
        let result = try! await mockClient.sendRequest(endpoint: RecipeEndpoints.recipes, response: RecipeResponse.self)
        XCTAssertTrue(result.recipes!.count == 5)
    }
    
    func testEmptyRecipeResponse() async {
        let result = try! await mockClient.sendRequest(endpoint: RecipeEndpoints.empty, response: RecipeResponse.self)
        XCTAssertTrue(result.recipes!.isEmpty)
    }
    
    func testThrowsDecodingErrorOnMalformedRecipes() async throws {
        do {
            let _ = try await mockClient.sendRequest(endpoint: RecipeEndpoints.malformed, response: RecipeResponse.self)
            XCTFail("Expected decoding to fail")
        } catch {
            XCTAssertTrue(error is DecodingError)
        }
        
    }
}
