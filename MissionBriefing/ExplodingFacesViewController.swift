//
//  ExplodingFacesViewController.swift
//  MissionBriefing
//
//  Created by Sean Calkins on 3/30/16.
//  Copyright © 2016 Sean Calkins. All rights reserved.
//

import UIKit
import CoreMotion

class ExplodingFacesViewController: UIViewController {

    var imageView = UIImageView()
    var totes = UIImageView()
    var lastLocation: CGPoint = CGPointMake(0,0)
    
    var animator:UIDynamicAnimator? = nil;
    let gravity = UIGravityBehavior()
    let collider = UICollisionBehavior()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//
//        self.totes = UIImageView(image: UIImage(named: "\(1)"))
//        self.view.addSubview(totes)
        
      //  var panRecognizer = UIPanGestureRecognizer(target: self, action: "detectPan")
        
       // self.gestureRecognizers = [panRecognizer]
    
    }

    
    func detectPan(recognizer: UIPanGestureRecognizer) {
        let translation = recognizer.translationInView(self.view)
        totes.center = CGPointMake(lastLocation.x + translation.x, lastLocation.y + translation.y)
    }
    
    func detectPan() {
        
    }
    
    @IBAction func face1Tapped(sender: UIButton) {
        self.createFace("1")
    }
    
    @IBAction func face2Tapped(sender: UIButton) {
        self.createFace("phil")
    }
    
    @IBAction func face3Tapped(sender: UIButton) {
        self.createFace("garretFace")
    }

    @IBAction func face4Tapped(sender: UIButton) {
        self.createFace("phil3")
    }
    
    func animatorCreation() {
       
            
            animator = UIDynamicAnimator(referenceView:self.view);
            
            gravity.addItem(imageView);
            gravity.gravityDirection = CGVectorMake(0.8, 2)
            animator?.addBehavior(gravity)
            
            collider.addItem(imageView)
            collider.translatesReferenceBoundsIntoBoundary = true
            animator?.addBehavior(collider)

    }
    
    func createFace(imageName: String) {
    
        self.imageView = UIImageView(image: UIImage(named: "\(imageName)"))
        self.view.addSubview(imageView)
        animatorCreation()
    }
}
