//
//  TweetTableHeaderView.swift
//  Twitter Clone
//
//  Created by Ahmed Mahmoud on 02/06/2021.
//

import UIKit
import SDWebImage

enum TweetingPlatform: String {
    case iPhone = "iPhone"
    case Android = "Android"
    case Web_App = "Web App"
    case iPad = "iPad"
    case Desktop = "Desktop"
}

struct TweetTableHeaderViewModel {
    let displayName: String
    let userName: String
    let avatar: URL?
    let comments: String
    let retwittes: String
    let likes: String
    let content: String
    let createdAt: Date
    let platform: TweetingPlatform
}

class TweetTableHeaderView: UITableViewHeaderFooterView, IdentifiableView {
    
    @IBOutlet weak var surfaceView: UIView!
    @IBOutlet private weak var avatar: UIImageView!
    @IBOutlet private weak var displayName: UILabel!
    @IBOutlet private weak var userName: UILabel!
    @IBOutlet private weak var content: UILabel!
    @IBOutlet private weak var timeCreated: UILabel!
    @IBOutlet private weak var dateCreated: UILabel!
    @IBOutlet private weak var platform: UILabel!
    @IBOutlet private weak var numOfRetweets: UILabel!
    @IBOutlet private weak var numOfLikes: UILabel!
    
    private var model: TweetTableHeaderViewModel!
    
    typealias T = TweetTableHeaderViewModel
    func configure(with model: TweetTableHeaderViewModel) {
        self.model = model
        
        avatar.sd_setImage(with: model.avatar, completed: nil)
        avatar.makeCirculer()
        displayName.text = model.displayName
        userName.text = "@\(model.userName)"
        content.text = model.content
        
        platform.text = "Twitter \(model.platform.rawValue)"
        
        numOfLikes.text = model.likes
        numOfRetweets.text = model.retwittes
        
        let forematter = DateFormatter()
        
        forematter.dateFormat = "MM/dd/yyyy"
        let dateString = forematter.string(from: model.createdAt)
        dateCreated.text = dateString
        
        forematter.dateFormat = "h:mm a"
        let timeString = forematter.string(from: model.createdAt)

        timeCreated.text = timeString
    }
    
    @IBAction private func didTapComments(_ sender: UIButton) {}
    @IBAction private func didTapRetweet(_ sender: UIButton) {}
    @IBAction private func didTapLike(_ sender: UIButton) {}
    @IBAction private func didTapShare(_ sender: UIButton) {}
}
