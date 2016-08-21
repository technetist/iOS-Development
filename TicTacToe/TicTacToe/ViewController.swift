//
//  ViewController.swift
//  TicTacToe
//
//  Created by Adrien Maranville on 8/20/16.
//  Copyright © 2016 Maranville Designs. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var lblWinner: UILabel!
    @IBOutlet var btnNewGame: UIButton!
    
    @IBAction func btnNewGame(_ sender: AnyObject) {
        activeGame = true
        
        drawCounter = 0
        
        
        gameState = [0,0,0,0,0,0,0,0,0] //0-empty, 1-noughts, 2-crosses
        
        playerActive = 1
        
        
        for i in 1..<10 {
            if let button = view.viewWithTag(i) as? UIButton{
                button.setImage(nil, for: [])
            }
        }
        lblWinner.center = CGPoint(x: lblWinner.center.x - 500, y: lblWinner.center.y)
        btnNewGame.center = CGPoint(x: btnNewGame.center.x - 500, y: btnNewGame.center.y)
        
        lblWinner.isHidden = true
        btnNewGame.isHidden = true
    }
    
    
    //1 is noughts, 2 is crosses
    var playerActive = 1
    
    var activeGame = true
    
    var drawCounter = 0

    
    var gameState = [0,0,0,0,0,0,0,0,0] //0-empty, 1-noughts, 2-crosses
    
    let winningCombos = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
    
    @IBAction func btnSquare(_ sender: AnyObject) {
        let activePosition = sender.tag - 1
        
        if gameState[activePosition] == 0 && activeGame {
            gameState[activePosition] = playerActive
            if playerActive == 1 {
                sender.setImage(UIImage(named: "nought.png"), for:[])
                playerActive = 2
                
            } else {
                sender.setImage(UIImage(named: "cross.png"), for:[])
                playerActive = 1
            }
            
            for combination in winningCombos {
                if gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]] && activeGame {
                    
                    //Win Scenario
                    activeGame = false
                    
                    lblWinner.isHidden = false
                    btnNewGame.isHidden = false
                    
                    if gameState[combination[0]] == 1 {
                        lblWinner.text = "Noughts won!"
                    } else {
                        lblWinner.text = "Crosses won!"
                    }
                    
                    UIView.animate(withDuration: 1, animations: {
                        self.lblWinner.center = CGPoint(x: self.lblWinner.center.x + 500, y: self.lblWinner.center.y)
                        self.btnNewGame.center = CGPoint(x: self.btnNewGame.center.x + 500, y: self.btnNewGame.center.y)
                    })
                    
                    print(gameState[combination[0]])
                }
            }
            drawCounter += 1
            //draw scenario
            if drawCounter == 9 && activeGame {
                activeGame = false
                
                lblWinner.isHidden = false
                btnNewGame.isHidden = false
                
                lblWinner.text = "Draw!"
                
                UIView.animate(withDuration: 1, animations: {
                    self.lblWinner.center = CGPoint(x: self.lblWinner.center.x + 500, y: self.lblWinner.center.y)
                    self.btnNewGame.center = CGPoint(x: self.btnNewGame.center.x + 500, y: self.btnNewGame.center.y)
                })
            }
            print(drawCounter)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        lblWinner.isHidden = true
        btnNewGame.isHidden = true
        
        lblWinner.center = CGPoint(x: lblWinner.center.x - 500, y: lblWinner.center.y)
        btnNewGame.center = CGPoint(x: btnNewGame.center.x - 500, y: btnNewGame.center.y)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

