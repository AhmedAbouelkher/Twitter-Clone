//
//  HomeFeedTableCell.swift
//  Twitter Clone
//
//  Created by Ahmed Mahmoud on 31/05/2021.
//

import UIKit
import SDWebImage


protocol HomeFeedTableCellDelegate: AnyObject {
    func didTapMoreDropDownButton(_ cell: HomeFeedTableCell, with viewModel: HomeFeedTableCellViewModel)
}

struct HomeFeedTableCellViewModel {
    let displayName: String
    let userName: String
    let avatar: URL?
    let comments: String
    let retwittes: String
    let likes: String
    let content: String
}

class HomeFeedTableCell: UITableViewCell, IdentifiableView {
    
    
    public weak var delegate: HomeFeedTableCellDelegate?
    
    @IBOutlet private weak var avatarView: UIImageView!
    @IBOutlet private weak var displayNameLabel: UILabel!
    @IBOutlet private weak var userNameLabel: UILabel!
    @IBOutlet private weak var contentsLabel: UILabel!
    @IBOutlet private weak var actionsStackView: UIStackView!
    @IBOutlet private weak var moreDropDownButton: UIButton!
    
    private var model: HomeFeedTableCellViewModel!
    
    private var commentsAction: HomeFeedTableCellAction!
    private var retwitteAction: HomeFeedTableCellAction!
    private var loveAction: HomeFeedTableCellAction!
    
    //MARK:- Life Cycle
    override func awakeFromNib() {
        
        commentsAction  = HomeFeedTableCellAction(frame: CGRect(x: 0, y: 0, width: 50, height: 25))
        
        retwitteAction = HomeFeedTableCellAction(frame: CGRect(x: 0, y: 0, width: 50, height: 25))
        
        loveAction = HomeFeedTableCellAction(frame: CGRect(x: 0, y: 0, width: 50, height: 25))
        
        
        [
            commentsAction,
            retwitteAction,
            loveAction,
        ].forEach {
            $0!.delegate = self
            actionsStackView.addArrangedSubview($0!)
        }
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        avatarView.image = nil
        displayNameLabel.text = nil
        userNameLabel.text = nil
        contentsLabel.text = nil
        commentsAction.setLabel(with: nil)
        retwitteAction.setLabel(with: nil)
        loveAction.setLabel(with: nil)
    }
    
    
    typealias T = HomeFeedTableCellViewModel
    func configure(with model: HomeFeedTableCellViewModel) {
        self.model = model
        
        avatarView.sd_setImage(with: model.avatar, completed: nil)
        avatarView.makeCirculer()
        displayNameLabel.text = model.displayName
        userNameLabel.text = "@\(model.userName)"
        contentsLabel.text = model.content
        
        commentsAction.configure(
            with: model.comments,
            icon: UIImage(systemName: "bubble.right"),
            type: .comment
        )
        retwitteAction.configure(
            with: model.retwittes,
            icon: UIImage(systemName: "arrow.2.squarepath"),
            type: .retweet
        )
        loveAction.configure(
            with: model.likes,
            icon: UIImage(systemName: "heart"),
            type: .love
        )
    }
    
    @IBAction private func didTapMoreDropDownButton() {
        delegate?.didTapMoreDropDownButton(self, with: model)
    }
}


extension HomeFeedTableCell: HomeFeedTableCellActionDelgate {
    
    func didTapAction(_ action: HomeFeedTableCellAction, with type: HomeFeedTableCellActionType) {
        switch type {
        
        case .comment:
            break
        case .retweet:
            break
        case .love:
            action.setIcon(with: UIImage(systemName: "suit.heart.fill"), color: .systemRed)
        case .none:
            break
        }
    }
    
    
}
