//
//  HomeFeedTableCell.swift
//  Twitter Clone
//
//  Created by Ahmed Mahmoud on 31/05/2021.
//

import UIKit
import SDWebImage

class HomeFeedTableCell: UITableViewCell, IdentifiableCell {
    
    
    @IBOutlet weak var avatarView: UIImageView!
    @IBOutlet weak var displayNameLabel: UILabel!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var contentsLabel: UILabel!
    @IBOutlet weak var actionsStackView: UIStackView!
    @IBOutlet weak var moreDropDownButton: UIButton!
    
    
    override func awakeFromNib() {
        avatarView.sd_setImage(with: K.Urls.personalImage, completed: nil)
        avatarView.makeCirculer()
        
        contentsLabel.text = "I'm thinking of doing a demo project to help me understand more iOS native implementations and concepts, with API calls and a usable UI/UX experiencِAny Suggestions?"
        
        
        let commentsAction = HomeFeedTableCellAction(frame: CGRect(x: 0, y: 0, width: 50, height: 25))
        commentsAction.configure(with: "52.2K", icon: UIImage(systemName: "bubble.right"))
        
        let retwitteAction = HomeFeedTableCellAction(frame: CGRect(x: 0, y: 0, width: 50, height: 25))
        retwitteAction.configure(with: "5,129", icon: UIImage(systemName: "arrow.2.squarepath"))
        
        let loveAction = HomeFeedTableCellAction(frame: CGRect(x: 0, y: 0, width: 50, height: 25))
        loveAction.configure(with: "50", icon: UIImage(systemName: "heart"))
        
        [
            commentsAction,
            retwitteAction,
            loveAction,
            
        ].forEach { actionsStackView.addArrangedSubview($0) }
        
        
    }
    
    
    typealias T = String
    func configure(with model: String) {
        
        
    }
    
    @IBAction private func didTapMoreDropDownButton() {
        print(#function)
    }
}
