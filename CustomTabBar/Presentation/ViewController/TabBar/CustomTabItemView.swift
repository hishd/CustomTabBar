//
//  CustomItemView.swift
//  CustomTabBar
//
//  Created by Hishara Dilshan on 2022-07-27.
//

import Foundation
import UIKit

class CustomTabItemView: UIView {
    let index: Int
    private let item: CustomTabBarItem
    private var callback: ((Int) -> Void)
    
    private lazy var tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTapGesture))

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
    
    var isSelected: Bool = false {
        didSet {
            animateItems()
        }
    }
    
    init(with item: CustomTabBarItem, callback: @escaping (Int) -> Void) {
        self.item = item
        self.index = item.index
        self.callback = callback
        super.init(frame: .zero)
        
        setupHierarchy()
        setupLayoutConstraints()
        setupProperties()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupHierarchy() {
        self.addSubview(containerView)
        containerView.addSubviews(nameLabel, iconImageView, underLineView)
    }
    
    private func setupLayoutConstraints() {
        containerView.anchor(top: self.topAnchor, left: self.leftAnchor, bottom: self.bottomAnchor, right: self.rightAnchor)
        containerView.center(inView: self)
        
        nameLabel.anchor(left: self.leftAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, paddingBottom: 20)
        
        iconImageView.anchor(bottom: nameLabel.topAnchor, width: 40, height: 40)
        iconImageView.centerX(inView: self)
        
        underLineView.centerX(inView: self)
        underLineView.centerY(inView: nameLabel)
        underLineView.setDimensions(height: 4, width: 40)
    }
    
    private func setupProperties() {
        nameLabel.configureWith(item.title,
                                color: .white.withAlphaComponent(0.4),
                                alignment: .center,
                                size: 11,
                                weight: .semibold)
        underLineView.backgroundColor = .white
        underLineView.setupCornerRadius(2)
        
        iconImageView.image = isSelected ? item.selectedIcon : item.icon
        
        self.addGestureRecognizer(tapGesture)
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
    
    @objc func handleTapGesture() {
        callback(item.index)
    }
    
}
