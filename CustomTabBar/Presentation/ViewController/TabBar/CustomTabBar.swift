//
//  CustomTabBar.swift
//  CustomTabBar
//
//  Created by Hishara Dilshan on 2022-07-27.
//

import Foundation
import UIKit

class CustomTabBar: UIStackView {
    
    //Tab Bar Items
    private let profileTab = CustomTabItemView(with: .profile, index: 0)
    private let searchTab = CustomTabItemView(with: .search, index: 1)
    private let favouriteTab = CustomTabItemView(with: .favourites, index: 2)
    
    //Tap Gestures for each tab item
    private lazy var profileTabGesture = UITapGestureRecognizer(target: self, action: #selector(handleProfileTabGesture))
    private lazy var searchTabGesture = UITapGestureRecognizer(target: self, action: #selector(handleSearchTabGesture))
    private lazy var favouriteTabGesture = UITapGestureRecognizer(target: self, action: #selector(handleFavouriteTabGesture))
    
    private lazy var customTabItemViews: [CustomTabItemView] = [profileTab, searchTab, favouriteTab]
    
    var onTabSelected: ((Int) -> Void)?
    
    init() {
        super.init(frame: .zero)
        
        setupHierarchy()
        setupProperties()
        bind()
                
        self.setNeedsLayout()
        self.layoutIfNeeded()
        selectItem(index: 0)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupHierarchy() {
        addArrangedSubviews([profileTab, searchTab, favouriteTab])
    }
    
    private func setupProperties() {
        self.axis = .horizontal
        self.distribution = .fillEqually
        self.alignment = .center
        
        self.backgroundColor = .systemIndigo
        setupCornerRadius(30)
        
        customTabItemViews.forEach { tab in
            tab.translatesAutoresizingMaskIntoConstraints = false
            tab.clipsToBounds = true
        }
    }
    
    private func selectItem(index: Int) {
        customTabItemViews.forEach { item in
            item.isSelected = item.index == index
        }
        if let onTabSelected = onTabSelected {
            onTabSelected(index)
        }
    }
    
    //Bind the Tab Items with the gestures
    private func bind() {
        self.profileTab.addGestureRecognizer(profileTabGesture)
        self.searchTab.addGestureRecognizer(searchTabGesture)
        self.favouriteTab.addGestureRecognizer(favouriteTabGesture)
    }
    
    @objc func handleProfileTabGesture() {
        self.selectItem(index: profileTab.index)
    }
    
    @objc func handleSearchTabGesture() {
        self.selectItem(index: searchTab.index)
    }
    
    @objc func handleFavouriteTabGesture() {
        self.selectItem(index: favouriteTab.index)
    }
}
