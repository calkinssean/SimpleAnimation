//
//  LoggedInViewController.swift
//  MissionBriefing
//
//  Created by Sean Calkins on 3/28/16.
//  Copyright © 2016 Sean Calkins. All rights reserved.
//

import UIKit

class LoggedInViewController: UIViewController {
    
    var imageView = UIImageView()
    var imageFrame = CGRect()
    var num = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView = UIImageView(image: UIImage(named: "skate"))
        
        self.view.addSubview(imageView)
        
        imageView.center = self.view.center
        
        self.imageFrame = self.imageView.frame
        
        print(imageFrame)
        
        
    }
    
    @IBAction func getBigTapped(sender: UIButton) {
        
        self.getBig()
        
    }
    
    @IBAction func getFlippedTapped(sender: UIButton) {
        
        self.doFlip()
        
    }
    
    @IBAction func getSikTapped(sender: UIButton) {
        
        num = 0
        self.getSik()
        
    }
    //MARK: - Get big button function action
    // Make the image big, then small
    func getBig() {
        UIView.animateWithDuration(0.5, animations: {
            self.imageView.transform = CGAffineTransformMakeScale(2, 2)
        }) { (animated) in
            UIView.animateWithDuration(0.5, animations: {
                
                self.imageView.transform = CGAffineTransformMakeScale(1, 1)
                
            })
        }
    }
    
    func doFlip() {
        
        UIView.animateWithDuration(0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 2,
                                   options: [], animations: {
                                    self.imageView.transform = CGAffineTransformRotate(CGAffineTransformMakeTranslation(-100, 300), CGFloat(M_PI))
            }, completion:
            { (animated) in
                UIView.animateWithDuration(1, animations: {
                    
                    self.imageView.transform = CGAffineTransformIdentity
                    
                })
        })
        
    }
    
    func getSik() {
        UIView.animateWithDuration(1, animations: {
            
            self.imageView.frame = CGRect(x: 0, y: 0, width: self.imageView.frame.width, height: self.imageView.frame.height)
            
        }) { (animated) in
            UIView.animateWithDuration(0.5, animations: {
                
                self.smallRotate(90)
                
            })
        }
    }
    
    func droppinIn() {
        UIView.animateWithDuration(2, animations: {
            
            let viewFrame = self.view.frame
            self.imageView.center = CGPoint(x: self.imageView.center.x, y: viewFrame.height - 244)
            
        }) { (animated) in
            
            self.smallRotate(0)
            self.imageView.center = self.view.center
            
        }
    }
    
    
    
    func takeOff() {
        
        
        UIView.animateWithDuration(1, animations: {
            
            
            self.imageView.center = CGPoint(x: 150, y: 150)
            
        })
        
    }
    
    
    func smallRotate(degrees: CGFloat) {
        UIView.animateWithDuration(0.5, animations: {
            self.imageView.transform = CGAffineTransformMakeRotation(degrees)
        }) { (animated) in
             if self.num == 0 {
                
            self.droppinIn()
                self.num = 1
            
            }
            
        }
    }
}
