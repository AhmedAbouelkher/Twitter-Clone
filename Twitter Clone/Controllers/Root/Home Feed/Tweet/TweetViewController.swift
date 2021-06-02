//
//  TweetViewController.swift
//  Twitter Clone
//
//  Created by Ahmed Mahmoud on 01/06/2021.
//

import UIKit

typealias UITableViewProtocols = UITableViewDelegate & UITableViewDataSource

class TweetViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var tableHeaderView: TweetTableHeaderView!
    @IBOutlet weak var navgationBarTitleView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        configureNavgationBarTitleView()
        
        tableView.backgroundColor = .clear
        
        TweetTableHeaderView.register(in: tableView)
        
        self.tableView.sectionHeaderHeight = UITableView.automaticDimension
        self.tableView.estimatedSectionHeaderHeight = 38
    }
    
    private func configureNavgationBarTitleView() {
        let containerView = UIView()
        
        let label = UILabel()
        
        containerView.addSubview(label)
        containerView.frame = CGRect(x: 0, y: 0, width: 70, height: 20)
        
        label.text = "Tweet"
        label.font = .systemFont(ofSize: 19, weight: .bold)
        label.textColor = .reverser
        
        label.anchor(top: containerView.topAnchor, leading: containerView.leadingAnchor, bottom: containerView.bottomAnchor, trailing: containerView.trailingAnchor, padding: .init(top: 0, left: 10, bottom: 0, right: 10))
        
        
        navigationItem.titleView = containerView
    }
    
    
    
    
    
    @IBAction private func didTapBack(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    static public func storyboard() -> Self {
        let storyboard = UIStoryboard(name: "TweetScreens", bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: "\(Self.self)") as! Self
    }

}


extension TweetViewController: UITableViewProtocols {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = TweetTableHeaderView.dequeue(from: tableView)
        header.configure(with: TweetTableHeaderViewModel(displayName: "Ahmed Mahmoud", userName: "ahmedmahmoud", avatar: K.Urls.personalImage, comments: "50", retwittes: "10", likes: "100", content: "When parsing a date string using the abbreviated year pattern ('yy'), DateFormat must interpret the abbreviated year relative to some century. It does this by adjusting dates to be within 80 years before and 20 years after the time the parse function is called. For example, using", createdAt: Date(), platform: .Web_App))
        return header
    }
    
}
