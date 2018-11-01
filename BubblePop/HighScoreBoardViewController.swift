//
//  HighScoreBoardViewController.swift
//  BubblePop
//
//  Created by Zihui Lu on 8/5/18.
//  Copyright © 2018 Zihui Lu. All rights reserved.
//

import UIKit

class HighScoreBoardViewController: UIViewController {

    @IBOutlet weak var mainScreenButton: UIButton!

    @IBOutlet weak var scoreTable: UITableView!
    var playerRecords:[playerScore] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        playerRecords = createArray()
        
        scoreTable.delegate = self
        scoreTable.dataSource = self
        
    }
    
    @IBAction func toMainScreen(_ sender: UIButton) {
        sender.pulsta()
    }
    
    func createArray() -> [playerScore] {
        
        let userDefaults = UserDefaults.standard
        let decoded  = userDefaults.object(forKey: "PlayerRecords") as! Data
        let playerRecords = NSKeyedUnarchiver.unarchiveObject(with: decoded) as! [playerScore]
        
        return playerRecords
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

extension HighScoreBoardViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return playerRecords.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let playerRecord = playerRecords[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "playerScoreCell") as! playerScoreCell
        cell.setPlayerScore(playerRecord: playerRecord)
        return cell
    }
    
    
}









