//
//  CustomTabBarVC.swift
//  CustomTabBar
//
//  Created by Hishara Dilshan on 2022-07-27.
//

import Foundation
import UIKit

class CustomTabBarVC: UITabBarController {
    
    private let customTabBar = CustomTabBar()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupHierarchy()
        setupLayoutConstraints()
        setupProperties()
        bind()
        view.layoutIfNeeded()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
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
        let controllers = CustomTabItem.allCases.map { item in
            item.viewController
        }
        self.setViewControllers(controllers, animated: true)
    }
    
    private func selectTabWith(index: Int) {
        self.selectedIndex = index
    }
    
    private func bind() {
        customTabBar.onTabSelected = { index in
            self.selectTabWith(index: index)
        }
    }
}
