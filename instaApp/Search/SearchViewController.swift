//
//  RecomendedViewController.swift
//  SocialNetwork 
//
//  Created by Ruslan Dalgatov on 07.03.2023.
//

import UIKit

class SearchViewController: UIViewController, UISearchBarDelegate {

    // MARK: - Private properties

    private let searchBar = UISearchBar()
        
    //MARK: - View lifecycle
        override func viewDidLoad() {
            super.viewDidLoad()
            initialize()
        }

    // MARK: - UISearchBarDelegate
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        // Handle search button click
        if let searchText = searchBar.text {
            // Perform search with searchText
        }
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        // Handle text changes in search bar
        // You could use this to update search results in real-time
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        // Handle cancel button click
        searchBar.resignFirstResponder()
    }
    
    }
    // MARK: - Private methods

    private extension SearchViewController {
        func initialize(){
            view.backgroundColor = .white
            searchBar.placeholder = "Поиск"
            searchBar.delegate = self
            navigationItem.titleView = searchBar

        }
    }
