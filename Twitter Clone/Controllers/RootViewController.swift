//
//  ViewController.swift
//  Twitter Clone
//
//  Created by Ahmed Mahmoud on 30/05/2021.
//

import UIKit

class RootViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = K.Colors.accentColor
        
        tabBar.tintColor = .blueColor
        tabBar.isTranslucent = false
        
        tabBar.barTintColor = K.Colors.accentColor
    }
    
    private func configure() {
        
    }
}


