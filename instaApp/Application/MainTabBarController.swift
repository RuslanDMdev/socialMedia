//
//  tabbaViewController.swift
//  SocialNetwork 
//
//  Created by Ruslan Dalgatov on 07.03.2023.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tabBar.tintColor = .black
        self.tabBar.itemPositioning = .centered
        self.tabBar.barTintColor = .white
        self.tabBar.isTranslucent = false
        self.tabBar.tintColor = .tabBarItemAccent
        self.tabBar.unselectedItemTintColor = .tabBarItemLight
        
        
        // MARK: - VC properties
        let homeVC = FeedViewController()
        let searchVC = SearchViewController()
        let addPostVC = RealsViewController()
        let activityVC = ActivityViewController()
        let profileVC = ActivityViewController()
        
        
        // MARK: - Resizing images
        let houseIcon = UIImage(named: "house12")
        let resizedHouse = houseIcon?.resize(to: CGSize(width: 24, height: 24))
        let houseIconFill = UIImage(named: "houseFill")
        let resizedHouseFill = houseIconFill?.resize(to: CGSize(width: 24, height: 24))
        
        let searchIcon = UIImage(named: "search")
        let resizedSearch = searchIcon?.resize(to: CGSize(width: 24, height: 24))
        let searchIconFill = UIImage(named: "searchFill")
        let resizedSearchFill = searchIconFill?.resize(to: CGSize(width: 24, height: 24))
        
        let realsIcon = UIImage(named: "reals")
        let resizedReals = realsIcon?.resize(to: CGSize(width: 24, height: 24))
        let resizedRealsFill = realsIcon?.resize(to: CGSize(width: 24, height: 24))
        
        let likeheartIcon = UIImage(named: "likeheart")
        let resizedActivity = likeheartIcon?.resize(to: CGSize(width: 24, height: 24))
        
        let likeheartIconFill = UIImage(named: "likeheartFill")
        let resizedActivityFill = likeheartIconFill?.resize(to: CGSize(width: 24, height: 24))
        
        let profileIcon = UIImage(named: "Story ring")
        let resizedProfile = profileIcon?.resize(to: CGSize(width: 24, height: 24))
        let resizedProfileFill = profileIcon?.resize(to: CGSize(width: 24, height: 24))

        
        homeVC.tabBarItem = UITabBarItem(title: "", image: resizedHouse, selectedImage: resizedHouseFill)
        searchVC.tabBarItem = UITabBarItem(title: "", image: resizedSearch, selectedImage: resizedSearchFill)
        addPostVC.tabBarItem = UITabBarItem(title: "", image: resizedReals, selectedImage: resizedRealsFill)
        activityVC.tabBarItem = UITabBarItem(title: "", image: resizedActivity, selectedImage: resizedActivityFill)
        profileVC.tabBarItem = UITabBarItem(title: "", image: resizedProfile, selectedImage: resizedProfileFill)
        
        self.viewControllers = [homeVC, searchVC, addPostVC, activityVC, profileVC]
        


    }
}

// MARK: - Private extensions

private extension UIImage {
    func resize(to size: CGSize) -> UIImage {
        let renderer = UIGraphicsImageRenderer(size: size)
        return renderer.image { _ in
            self.draw(in: CGRect(origin: .zero, size: size))
        }
    }
}

private extension UIColor{
    static var tabBarItemAccent: UIColor {#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1) }
    static var mainWhite: UIColor {#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1) }
    static var tabBarItemLight: UIColor {#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1) }
}
