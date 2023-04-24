//
//  ViewController.swift
//  yape-challenge
//
//  Created by devsodep on 20/04/2023.
//

import UIKit

class RecipeViewController: UIViewController {
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!

    var presenter: ViewToPresenterProtocol?
    private var recipeArrayList: RecipeListModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        presenter?.startFetchingRecipes()
        // Do any additional setup after loading the view.
    }


}

extension RecipeViewController: PresenterToViewProtocol {
    func showRecipe(recipeArray: RecipeListModel) {
        recipeArrayList = recipeArray
    }
    func showError(error: Error) {
//                hideProgressIndicator(view: self.view)
        let alert = UIAlertController(title: "Alert", message: "Problem from API", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "ACEPTAR", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
    }
}

extension RecipeViewController: UISearchBarDelegate {

}

extension RecipeViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        recipeArrayList?.recipes.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        UITableViewCell()
    }


}
