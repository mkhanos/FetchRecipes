//
//  RecipeViewModelTests.swift
//  FetchRecipes
//
//  Created by Momo Khan on 6/3/25.
//

import XCTest
@testable import FetchRecipes

@MainActor
final class RecipeViewModelTests: XCTestCase {
    var networkClient: MockNetworkClient!
    var recipeService: RecipeService!
    var viewModel: RecipeViewModel!
    
    override func setUp() {
        super.setUp()
        networkClient = MockNetworkClient()
        recipeService = RecipeService(networkClient: networkClient)
        viewModel = RecipeViewModel(recipesService: recipeService)
    }
    
    override func tearDown() {
        viewModel = nil
        recipeService = nil
        networkClient = nil
        super.tearDown()
    }
    
    func testLoadRecipesSuccess() async {
        await viewModel.loadRecipes()
        
        XCTAssertFalse(viewModel.isLoading)
        XCTAssertNil(viewModel.errorMessage)
        XCTAssertFalse(viewModel.recipes.isEmpty)
        XCTAssertEqual(viewModel.recipes.count, 5)
    }
    
    func testLoadEmptySuccess() async {
        await viewModel.loadEmpty()
        
        XCTAssertFalse(viewModel.isLoading)
        XCTAssertNil(viewModel.errorMessage)
        XCTAssertTrue(viewModel.recipes.isEmpty)
    }
    
    func testLoadMalformedFailure() async {
        await viewModel.loadMalformed()
        
        XCTAssertFalse(viewModel.isLoading)
        XCTAssertEqual(viewModel.errorMessage, "Unknown error")
        XCTAssertTrue(viewModel.recipes.isEmpty)
    }
    
    func testExample() async {
        XCTAssertTrue(true)
    }
}
