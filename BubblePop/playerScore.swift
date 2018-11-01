//
//  playerScore.swift
//  BubblePop
//
//  Created by Zihui Lu on 7/5/18.
//  Copyright © 2018 Zihui Lu. All rights reserved.
//

import Foundation

class playerScore: NSObject, NSCoding {
    
    var playerName:String
    var playerDuration:Int
    var playerScore:Int
    
    
    init(playerName:String, playerDuration:Int, playerScore:Int) {
        self.playerName = playerName
        self.playerDuration = playerDuration
        self.playerScore = playerScore
    }
    
    required convenience init(coder aDecoder: NSCoder) {
        let playerName = aDecoder.decodeObject(forKey: "playerName") as! String
        let playerDuration = aDecoder.decodeInteger(forKey: "playerDuration")
        let playerScore = aDecoder.decodeInteger(forKey: "playerScore")
        self.init(playerName: playerName, playerDuration: playerDuration, playerScore: playerScore)
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(playerName, forKey: "playerName")
        aCoder.encode(playerDuration, forKey: "playerDuration")
        aCoder.encode(playerScore, forKey: "playerScore")
    }
    
}
