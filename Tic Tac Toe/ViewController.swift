//
//  ViewController.swift
//  Tic Tac Toe
//
//  Created by Matthew J. Perkins on 6/5/17.
//  Copyright © 2017 Matthew J. Perkins. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    

    @IBOutlet var winnerLabel: UILabel!
    
    @IBOutlet var playAgain: UIButton!
    
    @IBAction func playAgainPressed(_ sender: Any) {
        
        activePlayer = 1 //1 is O, 2 is X
        
        activeGame = true
        
        gameState = [0,0,0,0,0,0,0,0,0] // 0 = empty, 1 = O's, 2 = X's
        
        winnerLabel.isHidden = true
        playAgain.isHidden = true
        
        winnerLabel.center = CGPoint(x: winnerLabel.center.x-500, y: winnerLabel.center.y-500)
        playAgain.center = CGPoint(x: playAgain.center.x-500, y: playAgain.center.y-500)
        
        for i in 1..<10 {
        if let button2 = view.viewWithTag(i) as? UIButton {
            
            button2.setImage(nil, for: [])
            
            }
        }
        
    selectPlayer1.isHidden = false
    }
    
  var activePlayer = 1 //1 is O, 2 is X
    
  var activeGame = true
    
  var gameState = [0,0,0,0,0,0,0,0,0] // 0 = empty, 1 = O's, 2 = X's
    
  let winningCombinations = [[0,1,2],[3,4,5,],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
    
  var xImage = UIImage(named: "cross.png") as UIImage!
    
  var yImage = UIImage(named: "nought.png") as UIImage!

    @IBOutlet var button: UIButton!
    
    @IBAction func button1(_ sender: Any) {
        
        playerAnnounce.isHidden = true
        
        let activePosition = (sender as AnyObject).tag - 1
        
        if gameState[activePosition] == 0 && activeGame == true {
            
            gameState[activePosition] = activePlayer
        
        if activePlayer == 1 {
        
        (sender as AnyObject).setImage(xImage, for: .normal)
            
       print((sender as AnyObject).tag)
            
            activePlayer = 2
            
        } else {
        
            (sender as AnyObject).setImage(yImage, for: .normal)
            print((sender as AnyObject).tag)
            
            activePlayer = 1
            }
            
            for combination in winningCombinations {
            
                if gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]] {
                
                        activeGame = false
                    
                    winnerLabel.isHidden = false
                    playAgain.isHidden = false
                    
                    if gameState[combination[0]] == 1 {
                        
                        self.winnerLabel.text = "X's win!!"
                        
                    } else {
                        
                        self.winnerLabel.text = "O's win!!"
                    }
                    UIView.animate(withDuration: 1, animations: {
                    
                        self.winnerLabel.center = CGPoint(x: self.winnerLabel.center.x + 500, y: self.winnerLabel.center.y + 500)
                        self.playAgain.center = CGPoint(x: self.playAgain.center.x + 500, y: self.playAgain.center.y + 500)
                    
                    })
        }
    }
  
        }
    }

    @IBOutlet var playerAnnounce: UILabel!


    @IBOutlet var selectPlayer1: UIButton!
    
    @IBAction func selectPlayer(_ sender: Any) {
        
        selectPlayer1.isHidden = true
        
        
        let diceRoll = arc4random_uniform(2)
        
        if diceRoll == 1 {
        
        
            activePlayer = 1
            
            playerAnnounce.text = "X's play first"
            
            
            
            playerAnnounce.isHidden = false
        
        } else {
            
             activePlayer = 2
            
             playerAnnounce.text = "O's play first"
            
             playerAnnounce.isHidden = false
            
            
        
    }
    
         print(diceRoll)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        playerAnnounce.isHidden = true
        winnerLabel.isHidden = true
        playAgain.isHidden = true
        
        winnerLabel.center = CGPoint(x: winnerLabel.center.x-500, y: winnerLabel.center.y-500)
        playAgain.center = CGPoint(x: playAgain.center.x-500, y: playAgain.center.y-500)
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

