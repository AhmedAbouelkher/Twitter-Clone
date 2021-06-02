//
//  HomeFeedTableCellAction.swift
//  Twitter Clone
//
//  Created by Ahmed Mahmoud on 31/05/2021.
//

import UIKit


protocol HomeFeedTableCellActionDelgate: AnyObject {
    func didTapAction(_ action: HomeFeedTableCellAction, with type: HomeFeedTableCellActionType)
}


enum HomeFeedTableCellActionType {
    case comment
    case retweet
    case love
    case none
}

@IBDesignable
class HomeFeedTableCellAction: UIView {
    
    public weak var delegate: HomeFeedTableCellActionDelgate?
    
    public var view: UIView {
        get {
            self.contentView
        }
    }

    
    @IBOutlet private weak var contentView: UIView!
    private var imageView: UIImageView!
    private var contentLabel: UILabel!
    private var actionType: HomeFeedTableCellActionType!
    
    
    
    //MARK:- Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        
        imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.tintColor = .secondaryLabel
        
        
        contentLabel = UILabel()
        contentLabel.translatesAutoresizingMaskIntoConstraints = false
        
        contentLabel.tintColor = .secondaryLabel
        contentLabel.font = .systemFont(ofSize: 15)
        
        contentView.addSubview(imageView)
        contentView.addSubview(contentLabel)
        
        
        imageView.anchor(
            top: contentView.topAnchor,
            leading: contentView.leadingAnchor,
            bottom: contentView.bottomAnchor,
            trailing: nil,
            padding: .init(top: 5, left: 0, bottom: 5, right: 0)
        )
        
        contentLabel.anchor(
            top: contentView.topAnchor,
            leading: imageView.trailingAnchor,
            bottom: contentView.bottomAnchor,
            trailing: nil,
            padding: .init(top: 5, left: 4, bottom: 5, right: 5)
        )
        
        
        contentView.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapSelf))
        contentView.addGestureRecognizer(tapGesture)
        
    }
    
    internal required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setupView()
    }
    
    
    private func setupView() {
        let bundle = Bundle(for: type(of: self))
        UINib(nibName: "HomeFeedTableCellAction", bundle: bundle).instantiate(withOwner: self, options: nil)
        
        addSubview(contentView)
        contentView.frame = bounds
    }
    
    //MARK:- Configrations
    
    public func configure(
        with label: String,
        icon image: UIImage?,
        type: HomeFeedTableCellActionType = .none
    ) {
        imageView.image = image
        contentLabel.text = label
        actionType = type
    }
    
    public func setIcon(with image: UIImage?, color: UIColor? = .secondaryLabel) {
        UIView.animate(withDuration: 0.3) {
            self.imageView.image = image
            self.imageView.tintColor = color
        }
    }
    
    public func setLabel(with label: String?) {
        contentLabel.text = label
    }
    
    
    @objc
    private func didTapSelf() {
        delegate?.didTapAction(self, with: actionType)
    }
}
