//
//  ViewController.swift
//  yape-challenge
//
//  Created by devsodep on 20/04/2023.
//

import UIKit
import Kingfisher

class RecipeViewController: UIViewController {
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!

    var presenter: ViewToPresenterProtocol?

    private var recipeList: RecipeListModel?
    private var filteredList: RecipeListModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        setTable()
        presenter?.startFetchingRecipes()
        navigationController?.navigationBar.isHidden = true
        // Do any additional setup after loading the view.
    }

    func setTable() {
        searchBar.delegate = self

        tableView.delegate = self
        tableView.dataSource = self
        tableView.prefetchDataSource = self
        tableView.register(
            UINib(nibName:
                    "RecipeTableViewCell",
                  bundle: nil),
            forCellReuseIdentifier: "RecipeTableViewCell")
    }

}

extension RecipeViewController: PresenterToViewProtocol {

    func showRecipe(recipeArray: RecipeListModel) {
        recipeList = recipeArray
        tableView.reloadData()
    }

    func showError(error: Error) {
        let alert = UIAlertController(
            title: "Alert",
            message: "Problem from API",
            preferredStyle: UIAlertController.Style.alert)
        alert.addAction(
            UIAlertAction(
                title: "ACEPTAR",
                style: UIAlertAction.Style.default,
                handler: nil))
        self.present(alert,
                     animated: true,
                     completion: nil)
    }
}

extension RecipeViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar,
                   textDidChange searchText: String) {

        guard let recipeList else { return }
        let filtered = recipeList.recipes.filter{ model in
            model.title.lowercased()
                .contains(searchText.lowercased()) ||
            model.extendedIngredients.first(where: { ingredients in
                ingredients.name.lowercased()
                    .contains(searchText.lowercased()) ||
                ingredients.nameClean.lowercased()
                    .contains(searchText.lowercased()) ||
                ingredients.originalName.lowercased()
                    .contains(searchText.lowercased())
            }) != nil
        }
        filteredList = RecipeListModel(recipes: filtered)
        tableView.reloadData()
    }
}

extension RecipeViewController: UITableViewDataSource,
                                UITableViewDelegate,
                                UITableViewDataSourcePrefetching {

    func tableView(_ tableView: UITableView,
                   prefetchRowsAt indexPaths: [IndexPath]) {
        guard let recipeList else {
                return }
        let urls = indexPaths
            .compactMap { URL(string: recipeList.recipes[$0.row].image) }
        ImagePrefetcher(urls: urls) {
            skipped, failed, completed in
            print(" prefetched: \(completed)")
            print(" skipped: \(skipped)")
            print(" failed: \(failed)")
        }.start()
    }


    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        if !(searchBar.text?.isEmpty ?? true) {
            return filteredList?.recipes.count ?? 0
        } else {
            return recipeList?.recipes.count ?? 0
        }
    }

    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let recipeList,
              let cell = tableView
            .dequeueReusableCell(
                withIdentifier: "RecipeTableViewCell",
                for: indexPath) as? RecipeTableViewCell else {
            return UITableViewCell()
        }
        let isFilterOn = ( !(searchBar.text?.isEmpty ?? true) &&
                          filteredList != nil )
        let recipes =  isFilterOn ?
        filteredList!.recipes :
        recipeList.recipes
        cell.setCell(with: recipes[indexPath.row] )
        return cell
    }

}
