//
//  HomeViewController.swift
//  Twitter Clone
//
//  Created by Ahmed Mahmoud on 30/05/2021.
//

import UIKit
import FontAwesomeKit
import FloatingPanel

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
        tabBarItem.badgeColor = .blueColor
        
        navigationController?.tabBarItem = tabBarItem
        
        
        
        //MARK:- BarButtonItems
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "person"), style: .plain, target: self, action: #selector(didTapLeftBarButtonItem))
        
        navigationItem.rightBarButtonItems = [
            UIBarButtonItem(image: UIImage(systemName: "plus.square"), style: .plain, target: self, action: #selector(didTapCompositNewPost)),
            UIBarButtonItem(image: UIImage(systemName: "wand.and.stars"), style: .plain, target: self, action: #selector(didTapRightBarButtonItem))
        ]
        
        
        //MARK:- CenterTilte
        let logoImageView = UIImageView(image: FAKFontAwesome.twitterIcon(withSize: 30)?.getImage(with: 30, color: .blueColor))
        logoImageView.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        
        navigationItem.titleView = logoImageView
        
        
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.barTintColor = .accentColor
        
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
        let cell =  HomeFeedTableCell.dequeue(from: tableView, forIndexPath: indexPath)
        cell.configure(with: HomeFeedTableCellViewModel(
            displayName: "Ahmed Mahmoud",
            userName: "ahmedOffial",
            avatar: K.Urls.personalImage,
            comments: "50K", retwittes: "12.6K", likes: "100",
            content: "I'm thinking of doing a demo project to help me understand more iOS native implementations and concepts, with API calls and a usable UI/UX experiencِAny Suggestions?"
        )
        )
        cell.delegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let tweetVC = TweetViewController.storyboard()
        
        navigationController?.pushViewController(tweetVC, animated: true)
    }
    
}


extension HomeViewController: HomeFeedTableCellDelegate, FloatingPanelControllerDelegate {
    
    
    func didTapMoreDropDownButton(_ cell: HomeFeedTableCell, with viewModel: HomeFeedTableCellViewModel) {
        let fpc = FloatingPanelController(delegate: self)
        
        let vc = MoreDropDownPanelViewController(with: viewModel)
        
        vc.dismissFloatingPanel = {
            fpc.dismiss(animated: true, completion: nil)
        }
        
        fpc.set(contentViewController: vc)
        
        fpc.surfaceView.appearance = MoreDropDownPanelViewController.panelAppearance()
        fpc.layout = MoreDropDownPanelViewController.MyFloatingPanelLayout()
        
        
        fpc.surfaceView.grabberHandleSize = .init(width: 44.0, height: 5.0)
        
        
        fpc.backdropView.dismissalTapGestureRecognizer.isEnabled = true
        fpc.isRemovalInteractionEnabled = true
        
        
        self.present(fpc, animated: true)
    }

}
