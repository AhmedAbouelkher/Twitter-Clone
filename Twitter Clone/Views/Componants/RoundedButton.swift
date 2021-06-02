//
//  RoundedButton.swift
//  Twitter Clone
//
//  Created by Ahmed Mahmoud on 31/05/2021.
//

import UIKit

class RoundedButton: UIView {
    
    private let button: UIButton = {
        let button = UIButton()
        button.setTitle("Cancel", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 17, weight: .black)
        button.setTitleColor(.reverser, for: .normal)
        button.tintColor = .white
        button.backgroundColor = .blueAccent
        return button
    }()
    
    public var mainButton: UIButton { get { button } }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(button)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        button.frame = CGRect(x: 10, y: 0, width: width - 20, height: height)
        button.layer.cornerRadius = height / 2
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
