//
//  FeedViewController.swift
//  instaApp
//
//  Created by Ruslan Dalgatov on 18.01.2023.
//

import SnapKit
import UIKit

class FeedViewController: UIViewController {

    //MARK: - View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize ()

    }
}


// MARK: - Private methods

private extension FeedViewController {
    func initialize(){
        view.backgroundColor = .white
        navigationController?.navigationBar.tintColor = .black
        navigationItem.rightBarButtonItems = makeRightBarButtonItems()
        navigationItem.leftBarButtonItems = makeLeftBarButtonItems()
    }
    
    func makeRightBarButtonItems() -> [UIBarButtonItem]{
        let addBarButtunItem = UIBarButtonItem(title: "nil", image: UIImage(systemName: "plus"), target: self, action: #selector(didTapPlusButton))
        let directBarButtunItem = UIBarButtonItem(title: "nil", image: UIImage(systemName: "paperplane"), target: self, action: #selector(didTapDirectButton))
        return[directBarButtunItem, addBarButtunItem]
    }
    
    @objc func didTapPlusButton(){
        print("Add button tapped")
    }
    
    @objc func didTapDirectButton(){
        print("Direct button tapped")
    }
    
    func makeLeftBarButtonItems() -> [UIBarButtonItem] {
        let logoBarButtunItem = UIBarButtonItem(customView: LogoView())
        let dropDownButtomItem = UIBarButtonItem(title: nil, image: UIImage(systemName: "chevron.down"), target: self, action: nil, menu: makeDrowDownMenu())
    return [logoBarButtunItem, dropDownButtomItem]
    }
    
    func makeDrowDownMenu() -> UIMenu{
        let subItem = UIAction(title: "Подписки", image: UIImage(systemName: "person.2")) { _ in
            print("Subs")
        }
        let favsItem = UIAction(title: "Избранное", image: UIImage(systemName: "star")) { _ in
            print("Faforite")
        }
        return UIMenu(title: "", children: [subItem, favsItem])
    }
}
