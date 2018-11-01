//
//  MainScreenViewController.swift
//  BubblePop
//
//  Created by Zihui Lu on 6/5/18.
//  Copyright © 2018 Zihui Lu. All rights reserved.
//

import UIKit

class MainScreenViewController: UIViewController {

    
    @IBOutlet weak var playerName: UITextField!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var scoreBoadButton: UIButton!
    
    @IBAction func play(_ sender: UIButton) {
        sender.pulsta()
    }
    
    @IBAction func toScoreBoard(_ sender: UIButton) {
        sender.pulsta()
    }
    
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Go Game Setting" {
            if playerName.text != "" {
                if let svc = segue.destination as? SettingViewController {
                    let playerName = self.playerName.text
                    svc.playerName = playerName!
                }
            } else {
                if let svc = segue.destination as? SettingViewController {
                    let playerName = "Player"
                    svc.playerName = playerName
                }
            }
        }
    }

}
