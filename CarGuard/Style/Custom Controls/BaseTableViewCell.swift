//
//  BaseTableViewCell.swift
//  CarGuard
//
//  Created by Kamil Kwiatkowski on 25/07/2018.
//  Copyright © 2018 Dignital. All rights reserved.
//

import UIKit

class BaseTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        setUpCell()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setUpCell() {
        layer.cornerRadius    = frame.size.height/2
        tintColor             = Colors.seanDarkGrey
        backgroundColor       = Colors.seanDarkGrey.withAlphaComponent(0.7)
        clipsToBounds         = true
    }

}
