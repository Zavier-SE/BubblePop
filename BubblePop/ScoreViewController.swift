//
//  ScoreViewController.swift
//  BubblePop
//
//  Created by Zihui Lu on 6/5/18.
//  Copyright © 2018 Zihui Lu. All rights reserved.
//

import UIKit

class ScoreViewController: UIViewController {

    var playerName = "Player"
    var gameDuration = 60
    var maxBubbleNum = 15
    var score = 0
    
    @IBOutlet weak var ScoreLabel: UILabel!
    @IBOutlet weak var mainScreenButton: UIButton!
    @IBOutlet weak var scoreBoardButton: UIButton!

    
    @IBAction func toMainScreen(_ sender: UIButton) {
        sender.pulsta()
    }
    
    @IBAction func toScoreBoard(_ sender: UIButton) {
        sender.pulsta()
    }
    
    
    func storePlayerRecord() {
        let playerRecord = playerScore(playerName: self.playerName, playerDuration: self.gameDuration, playerScore: self.score)
        let userDefaults = UserDefaults.standard
        
        if let decoded  = userDefaults.object(forKey: "PlayerRecords") as? Data {
            var playerRecords = NSKeyedUnarchiver.unarchiveObject(with: decoded) as! [playerScore]
            playerRecords.append(playerRecord)
            let sortedplaterRecords = playerRecords.sorted { $0.playerScore > $1.playerScore }
            let encodedData: Data = NSKeyedArchiver.archivedData(withRootObject: sortedplaterRecords)
            userDefaults.set(encodedData, forKey: "PlayerRecords")
            userDefaults.synchronize()
        } else {
            var playerRecords = [playerScore]()
            playerRecords.append(playerRecord)
            let sortedplaterRecords = playerRecords.sorted { $0.playerScore > $1.playerScore }
            let encodedData: Data = NSKeyedArchiver.archivedData(withRootObject: sortedplaterRecords)
            userDefaults.set(encodedData, forKey: "PlayerRecords")
            userDefaults.synchronize()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        storePlayerRecord()
        ScoreLabel.text = "\(score)"
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}


//let userDefaults = UserDefaults.standard
//let decoded  = userDefaults.object(forKey: "playerRecords") as! Data
//let playerRecords = NSKeyedUnarchiver.unarchiveObject(with: decoded) as! [playerScore]
//for playerRecord in playerRecords {
//    print("\(playerRecord.playerName)")
//}

