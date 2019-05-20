//
//  AnimatedViewLabel.swift
//  RegisterAnimation
//
//  Created by Alexander Frederik Vreeken on 06/04/2019.
//  Copyright © 2019 Alexander Frederik Vreeken. All rights reserved.
//

import UIKit

class AnimatedViewLabel: UILabel {

    func setupView(superView: UIView) {
        self.text = "+"
        self.font = UIFont(name: MAIN_FONT, size: 21)
        self.textColor = RED_COLOR
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.centerXAnchor.constraint(equalTo: superView.centerXAnchor).isActive = true
        self.centerYAnchor.constraint(equalTo: superView.centerYAnchor).isActive = true
    }

}
