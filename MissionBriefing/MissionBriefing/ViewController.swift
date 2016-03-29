//
//  ViewController.swift
//  MissionBriefing
//
//  Created by Sean Calkins on 2/3/16.
//  Copyright © 2016 Sean Calkins. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var authenticationButton: UIButton!
    
    @IBOutlet weak var greetingLabel: UILabel!
    
    @IBOutlet weak var TIYLogo: UIImageView!
    
    @IBOutlet weak var AuthenticateButton: UIButton!
    
    @IBOutlet weak var LoginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        print("view did load")
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        self.LoginButton.alpha = 0
        self.view.backgroundColor = UIColor.whiteColor()
        self.nameTextField.text = ""
        self.passwordTextField.text = ""
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        
    }
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        if textField == nameTextField {
            passwordTextField.becomeFirstResponder()
            
        }
        
        if textField == passwordTextField {
            passwordTextField.resignFirstResponder()
        }
        
        return true
    }
    @IBAction func AuthenticateButton(sender: AnyObject) {
        var agentLastName = ""
        self.AuthenticateButton.transform = CGAffineTransformIdentity
        
        if let agentName = nameTextField.text {
            var otherName = agentName.componentsSeparatedByString(" ")
            if otherName.count > 1 {
                print(otherName[1])
                agentLastName = otherName[1]
                
            }
        }
        if passwordTextField.text == "Iron Yard" && nameTextField.text == "Sean Calkins" {
            greetingLabel.text = "Good evening, agent \(agentLastName)"
            
            self.view.backgroundColor = UIColor.greenColor()
            
            self.moveImage(TIYLogo)
            
            
        } else {
            greetingLabel.text = "Access Denied"
            self.view.backgroundColor = UIColor.redColor()
        }
    }
    func scaleImage(image: UIImageView) {
        UIView.animateWithDuration(2, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 2, options: [], animations: {
            
            image.transform = CGAffineTransformMakeScale(2, 2)
            image.transform = CGAffineTransformIdentity
            }, completion:
            { (animated) in
                
                
        })
    }
    
    @IBAction func loginTapped(sender: UIButton) {
        
        self.performSegueWithIdentifier("LoggedInSegue", sender: self)
        
    }
    
    
    func moveImage(image: UIImageView) {
        UIView.animateWithDuration(0.5, animations: {
            
            self.TIYLogo.transform = CGAffineTransformMakeScale(2, 2)
            
        }) { (animated) in
            
            
            UIView.animateWithDuration(0.5, animations: {
                
                self.TIYLogo.transform = CGAffineTransformIdentity
                
                
                if self.LoginButton.alpha == 0 {
                    
                    self.adjustButtonLocations()
                    
                    self.LoginButton.alpha = 1
                    
                }
                
            })
        }
        
    }
    
    func rotateImage(image: UIImageView) {
        UIView.animateWithDuration(2, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 2, options: .Repeat, animations: {
            
            self.TIYLogo.transform = CGAffineTransformMakeRotation(CGFloat(M_PI))
            
            }, completion:
            
            { (animated) in
                self.TIYLogo.transform = CGAffineTransformIdentity
                
        })
        
    }
    
    func adjustButtonLocations() {
        
        let loginFrame = self.LoginButton.frame
        let authenticateFrame = self.AuthenticateButton.frame
        
        UIView.animateWithDuration(0.5, animations: {
            
            self.AuthenticateButton.frame = CGRectMake(authenticateFrame.origin.x - authenticateFrame.width / 2 - 4, authenticateFrame.origin.y, authenticateFrame.width, authenticateFrame.height)
            self.LoginButton.frame = CGRectMake(loginFrame.origin.x + loginFrame.width / 2 + 4, authenticateFrame.origin.y, loginFrame.width, loginFrame.height)
            
        })
        
    }
    
}


