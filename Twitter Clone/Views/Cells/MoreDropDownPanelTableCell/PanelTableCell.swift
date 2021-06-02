//
//  PanelTableCell.swift
//  Twitter Clone
//
//  Created by Ahmed Mahmoud on 31/05/2021.
//

import UIKit


struct PanelTableCellViewModel {
    let title: String
    let icon: UIImage?
}

class PanelTableCell: UITableViewCell, IdentifiableView {
    
    @IBOutlet private weak var label: UILabel!
    @IBOutlet private weak var iconImageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        label.text = nil
        iconImageView.image = nil
    }
    
    typealias T = PanelTableCellViewModel
    
    func configure(with model: PanelTableCellViewModel) {
        label.text = model.title
        iconImageView.image = model.icon
    }
    
}
