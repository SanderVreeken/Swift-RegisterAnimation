//
//  ConfirmButtonTextField.swift
//  RegisterAnimation
//
//  Created by Alexander Frederik Vreeken on 06/04/2019.
//  Copyright © 2019 Alexander Frederik Vreeken. All rights reserved.
//

import UIKit

class AnimatedViewTextField: UITextField {

    func setupView(superView: UIView) {
        self.isHidden = true
        self.layer.borderColor = RED_COLOR.cgColor
        self.layer.borderWidth = 0.8
        self.layer.cornerRadius = 8
        
        self.font = UIFont(name: MAIN_FONT, size: 15)
        self.textColor = RED_COLOR
        self.textAlignment = .center
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.topAnchor.constraint(equalTo: superView.topAnchor, constant: 12).isActive = true
        self.trailingAnchor.constraint(equalTo: superView.trailingAnchor, constant: -12).isActive = true
        self.leadingAnchor.constraint(equalTo: superView.leadingAnchor, constant: 12).isActive = true
        self.heightAnchor.constraint(equalToConstant: 37).isActive = true
    }

}
