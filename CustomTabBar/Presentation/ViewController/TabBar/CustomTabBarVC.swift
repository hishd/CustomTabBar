//
//  CustomTabBarVC.swift
//  CustomTabBar
//
//  Created by Hishara Dilshan on 2022-07-27.
//

import Foundation
import UIKit

class CustomTabBarVC: UITabBarController {
    
    private let profileTab = CustomTabBarItem(
        index: 0,
        title: "Profile",
        icon: UIImage(systemName: "person.crop.circle")?.withTintColor(.white.withAlphaComponent(0.4), renderingMode: .alwaysOriginal),
        selectedIcon: UIImage(systemName: "person.crop.circle.fill")?.withTintColor(.white, renderingMode: .alwaysOriginal),
        viewController: ProfileVC())
    
    private let searchTab = CustomTabBarItem(
        index: 1,
        title: "Search",
        icon: UIImage(systemName: "magnifyingglass.circle")?.withTintColor(.white.withAlphaComponent(0.4), renderingMode: .alwaysOriginal),
        selectedIcon: UIImage(systemName: "magnifyingglass.circle.fill")?.withTintColor(.white, renderingMode: .alwaysOriginal),
        viewController: SearchVC())
    
    private let favouriteTab = CustomTabBarItem(
        index: 2,
        title: "Favourite",
        icon: UIImage(systemName: "heart.circle")?.withTintColor(.white.withAlphaComponent(0.4), renderingMode: .alwaysOriginal),
        selectedIcon: UIImage(systemName: "heart.circle.fill")?.withTintColor(.white, renderingMode: .alwaysOriginal),
        viewController: FavouritesVC())
    
    private lazy var tabBarTabs: [CustomTabBarItem] = [profileTab, searchTab, favouriteTab]
    
    private var customTabBar: CustomTabBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCustomTabBar()
        setupHierarchy()
        setupLayoutConstraints()
        setupProperties()
        view.layoutIfNeeded()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }
    
    private func setupCustomTabBar() {
        self.customTabBar = CustomTabBar(tabBarTabs: tabBarTabs, onTabSelected: { [weak self] index in
            self?.selectTabWith(index: index)
        })
    }
    
    private func setupHierarchy() {
        view.addSubview(customTabBar)
    }
    
    private func setupLayoutConstraints() {
        customTabBar.anchor(left: view.safeAreaLayoutGuide.leftAnchor,
                            bottom: view.safeAreaLayoutGuide.bottomAnchor,
                            right: view.safeAreaLayoutGuide.rightAnchor,
                            paddingLeft: 25,
                            paddingRight: 25,
                            height: 90)
    }
    
    private func setupProperties() {
        tabBar.isHidden = true
        customTabBar.addShadow()
        
        self.selectedIndex = 0
        let controllers = tabBarTabs.map { item in
            return item.viewController
        }
        self.setViewControllers(controllers, animated: true)
    }
    
    private func selectTabWith(index: Int) {
        self.selectedIndex = index
    }
}
