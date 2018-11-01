//
//  Bubble.swift
//  BubblePop
//
//  Created by Zihui Lu on 5/5/18.
//  Copyright © 2018 Zihui Lu. All rights reserved.
//

import Foundation

struct Bubble {
    
    var colour:String
    var points:Int
    
    var popped = false
    
    func getPoints() -> Int {
        return points
        
    }
    
    init(colour:String, points:Int) {
        self.colour = colour
        self.points = points
    }
    
}
