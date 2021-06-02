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
        view.backgroundColor = .accentColor
        
        tabBar.tintColor = .blueColor
        tabBar.isTranslucent = false
        
        tabBar.barTintColor = .accentColor
    }
    
    private func configure() {
        
    }
}


