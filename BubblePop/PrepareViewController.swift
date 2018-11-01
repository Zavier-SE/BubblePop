//
//  PrepareViewController.swift
//  BubblePop
//
//  Created by Zihui Lu on 8/5/18.
//  Copyright © 2018 Zihui Lu. All rights reserved.
//

import UIKit

class PrepareViewController: UIViewController {
    
    var playerName = "Player"
    var gameDuration = 60
    var timeLeft = 60
    var maxBubbleNum = 15
    var countDown = 4
    private weak var readyCountDownTimer: Timer?
    private weak var gameStartTimer: Timer?

    @IBOutlet weak var readyCountDownLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        readyCountDownTimer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true ) { timer in
            self.countDown = self.countDown - 1
            self.readyCountDownLabel.text = "\(self.countDown)"
        }
        
        gameStartTimer = Timer.scheduledTimer(withTimeInterval:3.0 , repeats: false){ timer in
            self.readyCountDownTimer?.invalidate()
            self.performSegue(withIdentifier: "Start Game", sender: self)
        }

    }

    

    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Start Game" {
            if let gvc = segue.destination as? GameViewController {
                gvc.playerName = playerName
                gvc.gameDuration = gameDuration
                gvc.timeLeft = gameDuration
                gvc.maxBubbleNum = maxBubbleNum
            }
        }
    }

}
