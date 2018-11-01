//
//  playerScoreCell.swift
//  BubblePop
//
//  Created by Zihui Lu on 8/5/18.
//  Copyright © 2018 Zihui Lu. All rights reserved.
//

import UIKit

class playerScoreCell: UITableViewCell {

    @IBOutlet weak var playerName: UILabel!
    @IBOutlet weak var playTime: UILabel!
    @IBOutlet weak var playerScore: UILabel!
    
    
    func setPlayerScore(playerRecord: playerScore) {
        playerName.text = playerRecord.playerName
        playTime.text = "\(playerRecord.playerDuration)s"
        playerScore.text = "\(playerRecord.playerScore)"
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
