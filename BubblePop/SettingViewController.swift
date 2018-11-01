//
//  SettingViewController.swift
//  BubblePop
//
//  Created by Zihui Lu on 5/5/18.
//  Copyright © 2018 Zihui Lu. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController {
    
    var playerName = "Player"
    var gameDuration = 60
    var maxBubbleNum = 15
    
    @IBOutlet weak var duration: UILabel!
    @IBOutlet weak var bubbleNumber: UILabel!
    @IBOutlet weak var durationChanger: UISlider!
    @IBOutlet weak var bubbleNumberChanger: UISlider!
    @IBOutlet weak var startButton: UIButton!

    
    @IBAction func durationChange(_ sender: UISlider) {
        gameDuration = Int(durationChanger.value)
        duration.text = "\(gameDuration)s"
    }
    
    @IBAction func bubbleNumberChange(_ sender: UISlider) {
        maxBubbleNum = Int(bubbleNumberChanger.value)
        bubbleNumber.text = "\(maxBubbleNum)"
    }
    
    @IBAction func gameStart(_ sender: UIButton) {
        sender.pulsta()
    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Prepare" {
            if let pvc = segue.destination as? PrepareViewController {
                pvc.playerName = playerName
                pvc.gameDuration = gameDuration
                pvc.timeLeft = gameDuration
                pvc.maxBubbleNum = maxBubbleNum
            }
        }
    }
    
}
