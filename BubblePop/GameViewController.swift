//
//  ViewController.swift
//  BubblePop
//
//  Created by Zihui Lu on 5/5/18.
//  Copyright © 2018 Zihui Lu. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
    var playerName = "Player"
    var gameDuration = 60
    var timeLeft = 60
    var maxBubbleNum = 15
    var score = 0
    
    private lazy var game = BubblePop(numberOfMaximumBubble: maxBubbleNum)
    
    @IBOutlet weak var timeLeftLabel: UILabel!
    @IBOutlet weak var gameArea: UIView!
    @IBOutlet weak var totalScore: UILabel!
    
    var bubbleButtons = [UIButton]()

    
    private weak var repeatTimer: Timer?
    private weak var finishTimer: Timer?
    private weak var buttonRemoveTimer: Timer?
    private weak var bubbleMoveTimer: Timer?
    
    
    
    
    
    
    
    
    @IBAction func touchBubble(_ sender: UIButton) {
        
        if let bubbleNumber = bubbleButtons.index(of: sender){
            let bubble = game.bagOfBubbles[bubbleNumber]
            let points = game.pop(at: bubble)
        
            self.score += points
            totalScore.text = "Score:\(score)"
            sender.shrink()
            buttonRemoveTimer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: false) { timer in
                sender.removeFromSuperview()
            }
        }
    }
    
    func setBubbleButtons() {
        
        bubbleButtons.removeAll()
        for bubble in game.bagOfBubbles {
            let image = UIImage(imageLiteralResourceName: "\(bubble.colour).png")
            let bubbleButton = UIButton(frame: CGRect(x: 0.0, y: 0.0, width: 90, height: 90))
            bubbleButton.setImage(image, for: UIControlState.normal)
            bubbleButtons.append(bubbleButton)
        }
        
    }
    
    func showBubbleButton() {
        var existingBubbles = [UIButton]()
        
        while existingBubbles.count == 0 {
            setBubbleButtons()
            for bubbleButton in bubbleButtons {
                bubbleButton.frame.origin = CGPoint(x: RandomX(), y: RandomY())
                if locationAvaliable(for: bubbleButton) {
                    bubbleButton.addTarget(self, action: #selector(touchBubble(_:)), for: UIControlEvents.touchUpInside)
                    gameArea.addSubview(bubbleButton)
                    existingBubbles.append(bubbleButton)
                }
            }
        }
        
        for bubble in bubbleButtons {
            bubble.pulsta()
        }
        
        for i in 0..<bubbleButtons.count{
            if (i % 2) == 0 {
                self.bubbleButtons[i].shake1()
            } else {
                self.bubbleButtons[i].shake2()
            }
        }
        
        existingBubbles.removeAll()
    }

    func locationAvaliable(for newBubble:UIButton) -> Bool {
        var validLocation = true
        for subview in gameArea.subviews {
            if let existingBubble = subview as? UIButton {
                if existingBubble.frame.intersects(newBubble.frame) {
                    validLocation = false
                    break
                }
            }
        }
        return validLocation
    }
    
    
    
    
    
    
    

    func RandomX() -> CGFloat {
        let randomX = CGFloat(arc4random_uniform(UInt32(gameArea.frame.width-100)))
        return randomX
    }
    
    func RandomY() -> CGFloat {
        let randomY = CGFloat(arc4random_uniform(UInt32(gameArea.frame.height-100)))
        return randomY
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.timeLeftLabel.text = "Time Left:\(self.timeLeft)"
        
        repeatTimer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            for view in self.gameArea.subviews {
                view.removeFromSuperview()
            }
            self.timeLeft = self.timeLeft - 1
            self.timeLeftLabel.text = "Time Left:\(self.timeLeft)"
            self.game.updateBag(numberOfMaximumBubble: self.maxBubbleNum)
            self.showBubbleButton()
            
            
        }
        
        finishTimer = Timer.scheduledTimer(withTimeInterval: TimeInterval(gameDuration), repeats: false){ timer in
            self.repeatTimer?.invalidate()
            self.performSegue(withIdentifier: "Show Score", sender: self)
        }
    }

    
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Show Score" {
            if let svc = segue.destination as? ScoreViewController {
                svc.playerName = playerName
                svc.gameDuration = gameDuration
                svc.maxBubbleNum = maxBubbleNum
                svc.score = score
            }
        }
    }
    

}


