//
//  SuperViewLabel.swift
//  RegisterAnimation
//
//  Created by Alexander Frederik Vreeken on 06/04/2019.
//  Copyright © 2019 Alexander Frederik Vreeken. All rights reserved.
//

import UIKit

class SuperViewLabel: UITextField {

    func setupView(superView: UIView) {
        self.isHidden = true
        self.font = UIFont(name: MAIN_FONT, size: 19)
        self.textColor = UIColor.white
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.centerXAnchor.constraint(equalTo: superView.centerXAnchor).isActive = true
        self.centerYAnchor.constraint(equalTo: superView.centerYAnchor).isActive = true
    }
    
    func changeLabelText(text: String) {
        self.text = text
    }

}
