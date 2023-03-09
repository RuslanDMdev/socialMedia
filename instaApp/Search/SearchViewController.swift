//
//  RecomendedViewController.swift
//  SocialNetwork 
//
//  Created by Ruslan Dalgatov on 07.03.2023.
//

import UIKit

class SearchViewController: UIViewController {

    // MARK: - Private properties

        
    //MARK: - View lifecycle
        override func viewDidLoad() {
            super.viewDidLoad()
            initialize()
        }

    }
    // MARK: - Private methods

    private extension SearchViewController {
        func initialize(){
            view.backgroundColor = .white
            navigationItem.title = "Search"
            navigationController?.navigationBar.tintColor = .black
        }
    }
