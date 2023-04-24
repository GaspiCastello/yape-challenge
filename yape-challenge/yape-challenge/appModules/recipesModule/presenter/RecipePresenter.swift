//
//  RecipePresenter.swift
//  yape-challenge
//
//  Created by devsodep on 23/04/2023.
//

import Foundation
import UIKit

class RecipePresenter: ViewToPresenterProtocol {

    weak var view: PresenterToViewProtocol?
    var interactor: PresenterToInteractorProtocol?
    var router: PresenterToRouterProtocol?

    func startFetchingRecipes() {
        interactor?.fetchRecipe()
    }

    func showRecipeDetailController(navigationController: UINavigationController) {
        router?.pushToDetailScreen(navigationController: navigationController)
    }

}

extension RecipePresenter: InteractorToPresenterProtocol {
    func recipeFetchedSuccess(recipeModel: RecipeListModel) {
        view?.showRecipe(recipeArray: recipeModel)
    }

    func recipeFetchFailed(error: Error) {
        view?.showError(error: error)
    }

}
