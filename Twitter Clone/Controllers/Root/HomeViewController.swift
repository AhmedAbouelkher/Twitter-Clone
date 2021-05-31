//
//  HomeViewController.swift
//  Twitter Clone
//
//  Created by Ahmed Mahmoud on 30/05/2021.
//

import UIKit
import FontAwesomeKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var tableVeiw: UITableView!

    
    //MARK:- Life Cycle
    
    override func viewDidLoad() {
        
        view.backgroundColor = .accentColor
        
        tableVeiw.backgroundColor = .accentColor
        
        
        HomeFeedTableCell.register(in: tableVeiw)
        
        
        //MARK:- TabBar Item
        let tabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "house.fill"), tag: 0)
        tabBarItem.imageInsets = UIEdgeInsets(top: 9, left: 0, bottom: -9, right: 0)
        tabBarItem.badgeColor = K.Colors.blueColor
        
        navigationController?.tabBarItem = tabBarItem
        
        
        
        //MARK:- BarButtonItems
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "person"), style: .plain, target: self, action: #selector(didTapLeftBarButtonItem))
        
        navigationItem.rightBarButtonItems = [
            UIBarButtonItem(image: UIImage(systemName: "plus.square"), style: .plain, target: self, action: #selector(didTapCompositNewPost)),
            UIBarButtonItem(image: UIImage(systemName: "wand.and.stars"), style: .plain, target: self, action: #selector(didTapRightBarButtonItem))
        ]
        
        
        //MARK:- CenterTilte
        let logoImageView = UIImageView(image: FAKFontAwesome.twitterIcon(withSize: 30)?.getImage(with: 30, color: K.Colors.blueColor))
        logoImageView.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        
        navigationItem.titleView = logoImageView
        
        
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.barTintColor = K.Colors.accentColor
        
        super.viewDidLoad()
    }
    
    
    @objc
    private func didTapCompositNewPost() {
        
    }
    
    @objc
    private func didTapRightBarButtonItem() {
        
    }
    @objc
    private func didTapLeftBarButtonItem() {
        
    }
}


extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return HomeFeedTableCell.dequeue(from: tableView, forIndexPath: indexPath)
    }
    
    
}
