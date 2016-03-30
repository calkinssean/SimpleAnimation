//
//  LoggedInViewController.swift
//  MissionBriefing
//
//  Created by Sean Calkins on 3/28/16.
//  Copyright © 2016 Sean Calkins. All rights reserved.
//

import UIKit
import CoreMotion

class LoggedInViewController: UIViewController {
    
    var imageView = UIImageView()
    var imageFrame = CGRect()
    var num = 0
    
    var animator:UIDynamicAnimator? = nil;
    let gravity = UIGravityBehavior()
    let collider = UICollisionBehavior()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView = UIImageView(image: UIImage(named: "skate"))
        
        self.view.addSubview(imageView)
        
        imageView.center = self.view.center
        
        self.imageFrame = self.imageView.frame
        
        print(imageFrame)
        
        
    }
    
    func createAnimatorStuff() {
        
        animator = UIDynamicAnimator(referenceView:self.view);
        
        gravity.addItem(imageView);
        gravity.gravityDirection = CGVectorMake(0, 0.8)
        animator?.addBehavior(gravity)
        
        collider.addItem(imageView)
        collider.translatesReferenceBoundsIntoBoundary = true
        animator?.addBehavior(collider)
        
        if self.imageView.center.y > 1000 {
            
            self.imageView.center.y = -66
            
        }
        
        
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
                self.imageView.center = self.view.center
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
                    
                    self.imageView.center = self.view.center
                })
        })
        
    }
    
    
    // MARK: - Get Sik
    func getSik() {
        UIView.animateWithDuration(1, animations: {
            
            self.imageView.frame = CGRect(x: self.view.center.x - self.imageView.frame.width / 2, y: 0, width: self.imageView.frame.width, height: self.imageView.frame.height)
            
        }) { (animated) in
            UIView.animateWithDuration(1, animations: {
                
             self.createAnimatorStuff()
                
            }) { (animated) in
                UIView.animateWithDuration(1, animations: {
                    
                    self.imageView.center = self.view.center
                })
            }
        }
    }
    
    
}
