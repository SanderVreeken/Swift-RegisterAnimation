//
//  ConfirmButton.swift
//  RegisterAnimation
//
//  Created by Alexander Frederik Vreeken on 06/04/2019.
//  Copyright © 2019 Alexander Frederik Vreeken. All rights reserved.
//

import UIKit

class ConfirmButton: UIView {
    
    let confirmButtonLabel = ConfirmButtonLabel()

    func setupView(superView: UIView) {
        self.isHidden = true
        self.layer.cornerRadius = 8
        self.backgroundColor = RED_COLOR
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.bottomAnchor.constraint(equalTo: superView.bottomAnchor, constant: -12).isActive = true
        self.trailingAnchor.constraint(equalTo: superView.trailingAnchor, constant: -12).isActive = true
        self.leadingAnchor.constraint(equalTo: superView.leadingAnchor, constant: 12).isActive = true
        self.heightAnchor.constraint(equalToConstant: 37).isActive = true
        
        self.addSubview(confirmButtonLabel)
        confirmButtonLabel.setupView(superView: self)
    }

}
