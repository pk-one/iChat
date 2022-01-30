//
//  MainTabBarController.swift
//  iChat
//
//  Created by Pavel Olegovich on 22.01.2022.
//

import Foundation
import UIKit

class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let listViewController = ListViewController()
        let peopleViewController = PeopleViewController()
        
        setupTabBar()
        
        let boldConfiguration = UIImage.SymbolConfiguration(weight: .medium)
        
        let peopleImage = UIImage(systemName: "person.2", withConfiguration: boldConfiguration)
        let convImage = UIImage(systemName: "bubble.left.and.bubble.right", withConfiguration: boldConfiguration)
        
        guard let peopleImage = peopleImage, let convImage = convImage else { return }
        viewControllers = [
            generateNavigationController(rootViewController: peopleViewController, title: "People", image: peopleImage),
         
            generateNavigationController(rootViewController: listViewController, title: "Conversation", image: convImage),
            
        ]
    }
    
    private func setupTabBar() {
        tabBar.tintColor = #colorLiteral(red: 0.633436203, green: 0.4608362317, blue: 0.9255104661, alpha: 1)
        tabBar.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        tabBar.layer.borderWidth = 1
        tabBar.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1).cgColor
    }


    private func generateNavigationController(rootViewController: UIViewController, title: String, image: UIImage) -> UIViewController {
        let navigationVC = UINavigationController(rootViewController: rootViewController)
        navigationVC.tabBarItem.title = title
        navigationVC.tabBarItem.image = image
        return navigationVC
    }
}
