//
//  SAAuthTextField.swift
//  Skeletal-Storyboard
//
//  Created by Sean Allen on 6/29/18.
//  Copyright © 2018 Sean Allen. All rights reserved.
//

import Foundation
import UIKit


class AuthTextField: UITextField {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpField()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init( coder: aDecoder )
        setUpField()
    }
    
    
    private func setUpField() {
        borderStyle           = .none
        layer.cornerRadius    = frame.size.height/2
        tintColor             = Colors.seanDarkGrey
        textColor             = Colors.seanDarkGrey
        font                  = UIFont(name: Fonts.avenirNextMedium, size: 16)
        backgroundColor       = UIColor.white.withAlphaComponent(0.7)
        autocorrectionType    = .no
        clipsToBounds         = true
        
        let placeholder       = self.placeholder != nil ? self.placeholder! : ""
        let placeholderFont   = UIFont(name: Fonts.avenirNextMedium, size: 16)!
        attributedPlaceholder = NSAttributedString(string: placeholder, attributes:
            [.foregroundColor: Colors.seanDarkGrey,
             .font: placeholderFont])
        
        let indentView        = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        leftView              = indentView
        leftViewMode          = .always
    }
}
