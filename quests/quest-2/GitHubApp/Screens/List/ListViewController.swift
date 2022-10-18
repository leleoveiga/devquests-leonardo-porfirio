//
//  ViewController.swift
//  GitHubApp
//
//  Created by Rodrigo Borges on 29/09/21.
//

import UIKit

final class ListViewController: UIViewController, UISearchBarDelegate {

    private let listView: ListView = {

        let listView = ListView()
        return listView
    }()

    private let service = Service()
    
    let searchController: UISearchController = {
       let searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.placeholder = "Type a GitHub user name"
        return searchController
    }()
    
    init() {
        super.init(nibName: nil, bundle: nil)

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {

        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.title = "GitHub App 🐙"
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        
    }

    override func viewDidAppear(_ animated: Bool) {

        fetchRepositories()

    }

    override func loadView() {
        self.view = listView
    }
    
    func fetchRepositories() {
        listView.showLoadingView()
        service.fetchList { repositories in
            self.listView.updateView(with: repositories)
        }
    }
}
