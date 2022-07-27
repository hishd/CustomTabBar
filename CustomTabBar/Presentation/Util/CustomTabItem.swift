//
//  CustomTabItem.swift
//  CustomTabBar
//
//  Created by Hishara Dilshan on 2022-07-27.
//

import Foundation
import UIKit

enum CustomTabItem: String, CaseIterable {
    case profile
    case search
    case favourites
}

extension CustomTabItem {
    var viewController: UIViewController {
        switch(self) {
        case .profile:
            return ProfileVC()
        case .search:
            return SearchVC()
        case .favourites:
            return FavouritesVC()
        }
    }
    
    var icon: UIImage? {
        switch(self) {
        case .search:
            return UIImage(systemName: "magnifyingglass.circle")?.withTintColor(.white.withAlphaComponent(0.4), renderingMode: .alwaysOriginal)
        case .favourites:
            return UIImage(systemName: "heart.circle")?.withTintColor(.white.withAlphaComponent(0.4), renderingMode: .alwaysOriginal)
        case .profile:
            return UIImage(systemName: "person.crop.circle")?.withTintColor(.white.withAlphaComponent(0.4), renderingMode: .alwaysOriginal)
        }
    }
    
    var selectedIcon: UIImage? {
        switch self {
        case .search:
            return UIImage(systemName: "magnifyingglass.circle.fill")?.withTintColor(.white, renderingMode: .alwaysOriginal)
        case .favourites:
            return UIImage(systemName: "heart.circle.fill")?.withTintColor(.white, renderingMode: .alwaysOriginal)
        case .profile:
            return UIImage(systemName: "person.crop.circle.fill")?.withTintColor(.white, renderingMode: .alwaysOriginal)
        }
    }
    
    var name: String {
        return self.rawValue.capitalized
    }
}
