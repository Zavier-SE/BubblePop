//
//  BubblePop.swift
//  BubblePop
//
//  Created by Zihui Lu on 5/5/18.
//  Copyright © 2018 Zihui Lu. All rights reserved.
//

import Foundation

struct BubblePop {
    
    private(set) var totalBubbles = [Bubble]()
    private(set) var bagOfBubbles = [Bubble]()
    var lastPoped:Bubble? = nil
    
    private mutating func createTotalBubbles() {
        for _ in 1...40 {
            totalBubbles.append(Bubble(colour: "Red", points: 1))
        }
        for _ in 1...30 {
            totalBubbles.append(Bubble(colour: "Pink", points: 2))
        }
        for _ in 1...15 {
            totalBubbles.append(Bubble(colour: "Green", points: 5))
        }
        for _ in 1...10 {
            totalBubbles.append(Bubble(colour: "Blue", points: 8))
        }
        for _ in 1...5 {
            totalBubbles.append(Bubble(colour: "Black", points: 10))
        }
    }
    
    mutating func pop(at bubble:Bubble) -> Int {
        var score = 0
        // check if current bubble is the first one being popped
        if lastPoped == nil {
            score = bubble.getPoints()
            lastPoped = bubble
        } else {
            // check if the last popped bubble's colour math current one
            if lastPoped!.colour == bubble.colour {
                score = Int((Double(bubble.getPoints()) * 1.5).rounded())
                lastPoped = bubble
            } else {
                score = bubble.getPoints()
                lastPoped = bubble
            }
        }
        return score
    }

    mutating func updateBag(numberOfMaximumBubble:Int) {
        
        let randomNumberOfBubbles = numberOfMaximumBubble.arc4random
        
        bagOfBubbles.removeAll()
        for _ in 0...randomNumberOfBubbles{
            let randomIndex = totalBubbles.count.arc4random
            bagOfBubbles.append(totalBubbles[randomIndex])
        }
    }
    
    
    
    init(numberOfMaximumBubble: Int ) {
        
        let randomNumberOfBubbles = numberOfMaximumBubble.arc4random
        createTotalBubbles()
        for _ in 0..<randomNumberOfBubbles {
            let randomIndex = totalBubbles.count.arc4random
            bagOfBubbles.append(totalBubbles[randomIndex])
        }
        
    }
    
    
}


extension Int {
    var arc4random: Int {
        if self > 0 {
            return Int(arc4random_uniform(UInt32(self)))
        } else if self < 0 {
            return -Int(arc4random_uniform(UInt32(self)))
        } else {
            return 1
        }
    }
}

