//
//  customView.swift
//  simpleUIViewSubclass
//
//  Created by Sean Calkins on 4/12/16.
//  Copyright © 2016 Sean Calkins. All rights reserved.
//

import UIKit
import QuartzCore

@IBDesignable
class customView: UIView {

    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = cornerRadius > 0
            
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            
            layer.borderWidth = borderWidth
            
        }
        
    }
    
    @IBInspectable var borderColor: UIColor? {
        didSet {
            
            layer.borderColor = borderColor?.CGColor
            
        }
        
    }
    
}

