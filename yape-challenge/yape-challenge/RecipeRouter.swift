//
//  RecipeRouter.swift
//  yape-challenge
//
//  Created by devsodep on 23/04/2023.
//

import Foundation
import UIKit

class RecipeRouter: PresenterToRouterProtocol {

    static func createModule() -> RecipeViewController {

        let view = mainstoryboard.instantiateViewController(withIdentifier: "RecipeViewController") as! RecipeViewController

        let presenter: ViewToPresenterProtocol & InteractorToPresenterProtocol = RecipePresenter()
        let interactor: PresenterToInteractorProtocol = RecipeInteractor()
        let router:PresenterToRouterProtocol = RecipeRouter()

        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter

        return view

    }

    static var mainstoryboard: UIStoryboard{
        UIStoryboard(name: "Main", bundle: .main)
    }

    func pushToDetailScreen(navigationController: UINavigationController) {
        let detailVC = UIViewController()
        navigationController.pushViewController(detailVC, animated: true)
    }

}
