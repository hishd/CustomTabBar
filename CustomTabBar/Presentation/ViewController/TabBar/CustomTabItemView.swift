//
//  CustomItemView.swift
//  CustomTabBar
//
//  Created by Hishara Dilshan on 2022-07-27.
//

import Foundation
import UIKit

class CustomTabItemView: UIView {
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private lazy var iconImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    private let underLineView: UIView = {
        let view = UIView()
        return view
    }()
    
    private let containerView: UIView = {
        let view = UIView()
        return view
    }()
    
    let index: Int
    private let item: CustomTabItem
    var isSelected: Bool = false {
        didSet {
            animateItems()
        }
    }
    
    init(with item: CustomTabItem, index: Int) {
        self.item = item
        self.index = index
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupHierarchy() {
        self.addSubview(containerView)
        containerView.addSubviews(nameLabel, iconImageView, underLineView)
    }
    
    func setupLayoutConstraints() {
        containerView.anchor(top: self.topAnchor, left: self.leftAnchor, bottom: self.bottomAnchor, right: self.rightAnchor)
        containerView.center(inView: self)
        
        iconImageView.anchor(top: self.topAnchor, bottom: nameLabel.topAnchor, width: 40, height: 40)
        iconImageView.centerX(inView: self)
        
        nameLabel.anchor(left: self.leftAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, height: 16)
        
        underLineView.centerX(inView: self)
        underLineView.centerY(inView: nameLabel)
    }
    
    func setupProperties() {
        nameLabel.configureWith(item.name,
                                color: .white.withAlphaComponent(0.4),
                                alignment: .center,
                                size: 11,
                                weight: .semibold)
        underLineView.backgroundColor = .white
        underLineView.setupCornerRadius(2)
        
        iconImageView.image = isSelected ? item.selectedIcon : item.icon
    }
    
    private func animateItems() {
        UIView.animate(withDuration: 0.4) { [unowned self] in
            self.nameLabel.alpha = self.isSelected ? 0.0 : 1.0
            self.underLineView.alpha = self.isSelected ? 1.0 : 0.0
        }
        UIView.transition(with: iconImageView,
                          duration: 0.4,
                          options: .transitionCrossDissolve) { [unowned self] in
            self.iconImageView.image = self.isSelected ? self.item.selectedIcon : self.item.icon
        }
    }
    
}
