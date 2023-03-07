//
//  MainTabBarController.swift
//  SocialNetwork 
//
//  Created by Ruslan Dalgatov on 07.03.2023.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        generateTabBar()
    }
        
    private func generateTabBar(){
//        tabBar.backgroundColor = .white
        viewControllers = [
            generateVC(
                viewController: FeedViewController(),
                title: "Home",
//                image: UIImage(named: "house")),
            image: UIImage(systemName: "house")),

        generateVC(
            viewController: RecomendedViewController(),
            title: "Rec",
//            image: UIImage(named: "recomended")),
            image: UIImage(systemName: "house")),

        generateVC(
            viewController: RealsViewController(), title: "Reals",
//            image: UIImage(named: "reals")),
            image: UIImage(systemName: "house")),

        generateVC(
            viewController: LikesScreenViewController(),
            title: "Likes",
//            image: UIImage(named: "likeheart"))
            image: UIImage(systemName: "house")),
            
        generateVC(
            viewController: LikesScreenViewController(),
            title: "Likes",
    //        image: UIImage(named: "likeheart"))
            image: UIImage(systemName: "house")),

        ]
    }
    private func generateVC(viewController: UIViewController, title: String, image: UIImage?) -> UIViewController {
        viewController.tabBarItem.title = title
        viewController.tabBarItem.image = image
        return viewController
    }
    
    private func setTabBarApperance(){
        let positionOnX: CGFloat = 10
        let positionOnY: CGFloat = 14
        let width = tabBar.bounds.width - positionOnX * 2
        let height = tabBar.bounds.height + positionOnY * 2
        let roundLayer = CAShapeLayer()
        
        let bezierPath = UIBezierPath(
            roundedRect: CGRect(
                x: positionOnX,
                y: tabBar.bounds.minY - positionOnY,
                width: width, height: height),
                cornerRadius: height/2)
        
        roundLayer.path = bezierPath.cgPath
        
        tabBar.layer.insertSublayer(roundLayer, at: 0)
        tabBar.itemWidth = width / 5
        tabBar.itemPositioning = .centered
    }
}
