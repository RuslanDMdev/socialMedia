//
//  ActivityViewController.swift
//  SocialNetwork 
//
//  Created by Ruslan Dalgatov on 07.03.2023.
//

import UIKit

class ActivityViewController: UIViewController {
    
// MARK: - Private properties

    
//MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
    }

}
// MARK: - Private methods

private extension ActivityViewController {
    func initialize(){
        view.backgroundColor = .white
        navigationItem.leftBarButtonItems = makeLeftBarButtonItems()
    }
    
    private func makeLeftBarButtonItems() -> [UIBarButtonItem] {
        let titleBarButtunItem = UIBarButtonItem(customView: NotificationLabel())
        return [titleBarButtunItem]
    }
}
