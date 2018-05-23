//
//  ViewController.swift
//  Tic Tac Toe
//
//  Created by Shyam Pindoria on 21/06/2016.
//  Copyright © 2016 Shyam. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var activePlayer = 1
    
    var gameActive = true
    
    var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    
    let winCombinations = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
    
    var gobScore = 0
    
    var wizScore = 0
    
    @IBOutlet var gameOverLabel: UILabel!
    
    @IBOutlet var playAgainButton: UIButton!
    
    @IBOutlet var gobScoreLabel: UILabel!
    
    @IBOutlet var wizScoreLabel: UILabel!
    
    @IBOutlet var button: UIButton!

    @IBAction func playAgain(_ sender: AnyObject) {
        
        gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        activePlayer = 1
        gameActive = true
        
        var buttonToClear : UIButton
        
        for i in 0 ..< 9 {
            
            buttonToClear = view.viewWithTag(i) as! UIButton
            
            buttonToClear.setImage(nil, for: UIControlState())
        }
        
        UIView.animate(withDuration: 1, animations: {

            self.gameOverLabel.alpha = 0
            self.playAgainButton.alpha = 0
            
        })
        
        
    }
    
    @IBAction func buttonPressed(_ sender: AnyObject) {
        
        if gameState[sender.tag] == 0 && gameActive{
            
            gameState[sender.tag] = activePlayer
            
            if activePlayer == 1 {
                
                sender.setImage(UIImage(named: "goblin.png"), for: UIControlState())
                activePlayer = 2
                
            } else {
                
                sender.setImage(UIImage(named: "wizard.png"), for: UIControlState())
                activePlayer = 1
                
            }
        
            
            for combinations in winCombinations {
                
                if gameState[combinations[0]] != 0 && gameState[combinations[0]] == gameState[combinations[1]] && gameState[combinations[1]] == gameState[combinations[2]] {
                    
                    gameActive = false
                    
                    if gameState[combinations[0]] == 1 {
                        
                        gameOverLabel.text = "Goblins have won!"
                        gobScore += 1
                        gobScoreLabel.text = String(gobScore)
                        
                    } else {
                        
                        gameOverLabel.text = "Wizards have won!"
                        wizScore += 1
                        wizScoreLabel.text = String(wizScore)
                    }
                    
                    endGame()
                }
            }
            
            if gameActive {
                
                gameActive = false
                
                for buttonState in gameState {
                    
                    if buttonState == 0 {
                        gameActive = true
                    }
                }
                
                if !gameActive {
                    gameOverLabel.text = "Its a draw!"
                    endGame()
                }
            }
            
        }
    }
   
    
    func endGame() {
        UIView.animate(withDuration: 1, animations: {
            
            self.gameOverLabel.alpha = 1
            self.playAgainButton.alpha = 1
            
        })
    }
    
    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        
        gameOverLabel.alpha = 0
        playAgainButton.alpha = 0

        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

