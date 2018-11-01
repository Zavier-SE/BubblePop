//
//  UIButtonExtention.swift
//  BubblePop
//
//  Created by Zihui Lu on 8/5/18.
//  Copyright © 2018 Zihui Lu. All rights reserved.
//

import Foundation
import UIKit

extension UIButton {
    
    func pulsta() {
        
        let pulse = CASpringAnimation(keyPath:"transform.scale")
        pulse.duration = 0.2
        pulse.fromValue = 0.9
        pulse.toValue = 1.0
        pulse.autoreverses = true
        pulse.repeatCount = 2
        pulse.initialVelocity = 1.0
        
        layer.add(pulse, forKey: nil)
    }
    
    func shrink() {
        
        let shrink = CASpringAnimation(keyPath:"transform.scale")
        shrink.duration = 0.3
        shrink.fromValue = 0.5
        shrink.toValue = 1.0
        shrink.autoreverses = false
        shrink.repeatCount = 1
        shrink.initialVelocity = 0.6
        
        layer.add(shrink, forKey: nil)
    }
    
    func shake1() {
        
        let shake = CABasicAnimation(keyPath: "position")
        shake.duration = 0.2
        shake.repeatCount = 2
        shake.autoreverses = true
        
        let fromPoint = CGPoint(x: center.x - 5, y: center.y + 5)
        let fromValue = NSValue(cgPoint:fromPoint)
        
        let toPoint = CGPoint(x: center.x + 5, y: center.y - 5)
        let toValue = NSValue(cgPoint:toPoint)
        
        shake.fromValue = fromValue
        shake.toValue = toValue
        
        layer.add(shake, forKey: nil)
    }
    
    func shake2() {
        
        let shake = CABasicAnimation(keyPath: "position")
        shake.duration = 0.2
        shake.repeatCount = 2
        shake.autoreverses = true
        
        let fromPoint = CGPoint(x: center.x - 5, y: center.y - 5)
        let fromValue = NSValue(cgPoint:fromPoint)
        
        let toPoint = CGPoint(x: center.x + 5, y: center.y + 5)
        let toValue = NSValue(cgPoint:toPoint)
        
        shake.fromValue = fromValue
        shake.toValue = toValue
        
        layer.add(shake, forKey: nil)
    }

    
}
