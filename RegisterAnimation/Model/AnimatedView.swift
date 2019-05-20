//
//  AnimatedView.swift
//  RegisterAnimation
//
//  Created by Alexander Frederik Vreeken on 06/04/2019.
//  Copyright © 2019 Alexander Frederik Vreeken. All rights reserved.
//

import UIKit

class AnimatedView: UIView {
    
    fileprivate var heightBeforeAnimation: NSLayoutConstraint?
    fileprivate var heightAfterAnimation: NSLayoutConstraint?
    fileprivate var widthBeforeAnimation: NSLayoutConstraint?
    fileprivate var widthAfterAnimation: NSLayoutConstraint?

    func setupView(superView: UIView, height: CGFloat, width: CGFloat, animatedViewLabel: AnimatedViewLabel, animatedViewTextField: AnimatedViewTextField, confirmButton: ConfirmButton) {
        heightBeforeAnimation = self.heightAnchor.constraint(equalToConstant: height)
        heightAfterAnimation = self.heightAnchor.constraint(equalToConstant: 110)
        heightBeforeAnimation?.isActive = true
        widthBeforeAnimation = self.widthAnchor.constraint(equalToConstant: width)
        widthAfterAnimation = self.widthAnchor.constraint(equalToConstant: superView.frame.width * 0.68)
        widthBeforeAnimation?.isActive = true
        
        self.backgroundColor = UIColor.white
        self.layer.cornerRadius = 8
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.centerXAnchor.constraint(equalTo: superView.centerXAnchor).isActive = true
        self.centerYAnchor.constraint(equalTo: superView.centerYAnchor).isActive = true
        
        self.addSubview(animatedViewLabel)
        animatedViewLabel.setupView(superView: self)
        
        self.addSubview(animatedViewTextField)
        animatedViewTextField.setupView(superView: self)
        self.addSubview(confirmButton)
        confirmButton.setupView(superView: self)
    }
    
    func animateHeightChangeOpen() {
        heightBeforeAnimation?.isActive = false
        heightAfterAnimation?.isActive = true
    }
    
    func animateWidthChangeOpen() {
        widthBeforeAnimation?.isActive = false
        widthAfterAnimation?.isActive = true
    }
    
    func animateHeightChangeClose() {
        heightAfterAnimation?.isActive = false
        heightBeforeAnimation?.isActive = true
    }
    
    func animateWidthChangeClose() {
        widthAfterAnimation?.isActive = false
        widthBeforeAnimation?.isActive = true
    }

}
