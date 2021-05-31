//
//  HomeFeedTableCellAction.swift
//  Twitter Clone
//
//  Created by Ahmed Mahmoud on 31/05/2021.
//

import UIKit

@IBDesignable
class HomeFeedTableCellAction: UIView {
    
    @IBOutlet weak var view: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var contentLabel: UILabel!
    
//    private var imageView: UIImageView!
//    private var contentLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        
//        imageView = UIImageView()
//        imageView.contentMode = .scaleAspectFit
//        imageView.translatesAutoresizingMaskIntoConstraints = false
//        imageView.tintColor = .secondaryLabel
//
//
//        contentLabel = UILabel()
//        contentLabel.translatesAutoresizingMaskIntoConstraints = false
//
//        contentLabel.tintColor = .secondaryLabel
//        contentLabel.font = .systemFont(ofSize: 15)
//
//        view.addSubview(imageView)
//        view.addSubview(contentLabel)
        
        
//        imageView.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: nil, padding: .init(top: 5, left: 0, bottom: 5, right: 0))
//
//        contentLabel.anchor(top: view.topAnchor, leading: imageView.trailingAnchor, bottom: view.bottomAnchor, trailing: nil, padding: .init(top: 5, left: 5, bottom: 5, right: 5))
        
        
        view.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapSelf))
        view.addGestureRecognizer(tapGesture)
                
    }
    
    internal required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setupView()
    }
    
    func setupView() {
        let bundle = Bundle(for: type(of: self))
        UINib(nibName: "HomeFeedTableCellAction", bundle: bundle).instantiate(withOwner: self, options: nil)
        
        addSubview(view)
        view.frame = bounds
    }
    
    public func configure(with label: String, icon image: UIImage?) {
        imageView.image = image
        contentLabel.text = label
    }
    
    
    @objc
    private func didTapSelf() {
        print("HERE")
    }
}
