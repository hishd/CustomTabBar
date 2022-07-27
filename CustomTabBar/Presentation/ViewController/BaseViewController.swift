//
//  BaseViewController.swift
//  CustomTabBar
//
//  Created by Hishara Dilshan on 2022-07-27.
//

import Foundation

protocol BaseViewController {
    //Add the subviews to the main view and sub views using this method
    func setupHierarchy()
    //Set the constraints of the layouts using this method
    func setupLayoutConstraints()
    //Set up layout attributes such as titles, images using this method
    func setupProperties()
}

extension BaseViewController {
    
}
