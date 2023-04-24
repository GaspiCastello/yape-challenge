//
//  RecipeProtocol.swift
//  yape-challenge
//
//  Created by devsodep on 23/04/2023.
//

import Foundation
import UIKit

protocol ViewToPresenterProtocol: AnyObject {
    var view: PresenterToViewProtocol? { get set }
    var interactor: PresenterToInteractorProtocol? { get set }
    var router: PresenterToRouterProtocol? { get set }
    func startFetchingRecipes()
    func showRecipeDetailController(navigationController: UINavigationController)

}

protocol PresenterToViewProtocol: AnyObject {
    func showRecipe(recipeArray: RecipeListModel)
    func showError(error: Error)
}

protocol PresenterToRouterProtocol: AnyObject {
    static func createModule() -> RecipeViewController
    func pushToDetailScreen(navigationController: UINavigationController)
}

protocol PresenterToInteractorProtocol: AnyObject {
    var presenter: InteractorToPresenterProtocol? { get set }
    func fetchRecipe()
}

protocol InteractorToPresenterProtocol: AnyObject {
    func recipeFetchedSuccess(recipeModel: RecipeListModel)
    func recipeFetchFailed(error: Error)
}

