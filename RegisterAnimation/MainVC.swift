//
//  ViewController.swift
//  RegisterAnimation
//
//  Created by Alexander Frederik Vreeken on 06/04/2019.
//  Copyright © 2019 Alexander Frederik Vreeken. All rights reserved.
//

import UIKit

class MainVC: UIViewController {
    
    let superViewLabel = SuperViewLabel()
    let animatedView = AnimatedView()
    let animatedViewLabel = AnimatedViewLabel()
    
    let animatedViewTextField = AnimatedViewTextField()
    let confirmButton = ConfirmButton()
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = RED_COLOR
        
        let superViewTap = UITapGestureRecognizer(target: self, action: #selector(self.handleSuperViewTapClose(_:)))
        view.addGestureRecognizer(superViewTap)
        
        view.addSubview(superViewLabel)
        superViewLabel.setupView(superView: view)
        
        view.addSubview(animatedView)
        animatedView.setupView(superView: view, height: 68, width: 68, animatedViewLabel: animatedViewLabel, animatedViewTextField: animatedViewTextField, confirmButton: confirmButton)
        let animatedViewTap = UITapGestureRecognizer(target: self, action: #selector(self.handleAnimatedViewTapOpen(_:)))
        animatedView.addGestureRecognizer(animatedViewTap)
        
        let confirmButtonTap = UITapGestureRecognizer(target: self, action: #selector(self.handleConfirmButtonTapClose(_:)))
        confirmButton.addGestureRecognizer(confirmButtonTap)
    }
    
    @objc func handleAnimatedViewTapOpen(_ sender: UITapGestureRecognizer) {
        UIView.animate(withDuration: ANIMATION_DURATION, animations: {
            self.animatedViewLabel.isHidden = true
            self.animatedView.animateHeightChangeOpen()
            self.view.layoutIfNeeded()
        }, completion: { (finished: Bool) in
            UIView.animate(withDuration: ANIMATION_DURATION, animations: {
                self.animatedView.animateWidthChangeOpen()
                self.view.layoutIfNeeded()
            }, completion: { (finished: Bool) in
                self.animatedViewTextField.isHidden = false
                self.confirmButton.isHidden = false
            })
        })
    }
    
    @objc func handleSuperViewTapClose(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
        UIView.animate(withDuration: ANIMATION_DURATION, animations: {
            self.animatedViewTextField.isHidden = true
            self.confirmButton.isHidden = true
            self.animatedView.animateWidthChangeClose()
            self.view.layoutIfNeeded()
        }, completion: { (finished: Bool) in
            UIView.animate(withDuration: ANIMATION_DURATION, animations: {
                self.animatedView.animateHeightChangeClose()
                self.view.layoutIfNeeded()
            }, completion: { (finished: Bool) in
                self.animatedViewLabel.isHidden = false
            })
        })
    }
    
    @objc func handleConfirmButtonTapClose(_ sender: UITapGestureRecognizer) {
        if animatedViewTextField.text!.count == 0 {
            let animation = CABasicAnimation(keyPath: "position")
            animation.duration = 0.07
            animation.repeatCount = 4
            animation.autoreverses = true
            animation.fromValue = NSValue(cgPoint: CGPoint(x: animatedViewTextField.center.x - 10, y: animatedViewTextField.center.y))
            animation.toValue = NSValue(cgPoint: CGPoint(x: animatedViewTextField.center.x + 10, y: animatedViewTextField.center.y))
            
            animatedViewTextField.layer.add(animation, forKey: "position")
        } else {
            view.endEditing(true)
            UIView.animate(withDuration: ANIMATION_DURATION, animations: {
                self.animatedViewTextField.isHidden = true
                self.confirmButton.isHidden = true
                self.animatedView.animateWidthChangeClose()
                self.view.layoutIfNeeded()
            }, completion: { (finished: Bool) in
                UIView.animate(withDuration: ANIMATION_DURATION, animations: {
                    self.animatedView.animateHeightChangeClose()
                    self.view.layoutIfNeeded()
                }, completion: { (finished: Bool) in
                    self.animatedView.isHidden = true
                    
                    let name = self.animatedViewTextField.text
                    self.superViewLabel.changeLabelText(text: "Welcome, \(name!)!")
                    self.superViewLabel.isHidden = false
                })
            })
        }
    }
}

