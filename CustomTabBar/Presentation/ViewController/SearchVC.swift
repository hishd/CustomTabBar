//
//  SearchVC.swift
//  CustomTabBar
//
//  Created by Hishara Dilshan on 2022-07-27.
//

import Foundation
import UIKit

class SearchVC: UIViewController, BaseViewController {
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.configureWith("Search", color: .black, alignment: .center, size: 28)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupHierarchy()
        setupLayoutConstraints()
        setupProperties()
    }
    
    func setupHierarchy() {
        view.addSubview(titleLabel)
    }
    
    func setupLayoutConstraints() {
        titleLabel.center(inView: view)
    }
    
    func setupProperties() {
        view.backgroundColor = .white
    }
}
