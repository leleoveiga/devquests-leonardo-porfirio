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
        searchController.searchBar.sizeToFit()
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
        
        searchController.searchResultsUpdater = self
        
    }

    override func viewDidAppear(_ animated: Bool) {
        fetchRepositoriesFrom(username: "leleoveiga")
    }

    override func loadView() {
        self.view = listView
    }
    
}

// MARK: fetch methods
extension ListViewController {
    
    func fetchRepositoriesFrom(username: String) {
        self.listView.showLoadingView()
        self.service.fetchList(user: username) { repositories in
            self.listView.updateView(with: repositories)
        }
    }
    
    func fetchUserFrom(username: String) {
        var user: User? = nil
        service.fetchUser(user: username) { data in
            user = data
        }
    }
}

// MARK: searchBarController
extension ListViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        if !searchController.isActive {
            return
        }
        
        var filterString: String?
        filterString = searchController.searchBar.text
        
        
        if let filterString {
            self.fetchRepositoriesFrom(username: filterString)
        }
    }
}
