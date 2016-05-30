//
//  BoardViewController.swift
//  NoughtsAndCrosses
//
//  Created by Alejandro Castillejo on 5/27/16.
//  Copyright © 2016 Julian Hulme. All rights reserved.
//

import UIKit

class BoardViewController: UIViewController {
    
    var gameObject:OXGame = OXGame()
    
    // All outlets
    @IBOutlet weak var BoardView: UIView!
    
    // Outlets for grid buttons
    @IBAction func GridButtonPushed(sender: AnyObject) {
        
        //print(String(sender.tag))
        sender.setTitle(String(gameObject.whosTurn()), forState: .Normal)
        gameObject.playMove(sender.tag)
        
        var gameState = gameObject.state()
        var game = 0
        
        if gameState == OXGame.OXGameState.complete_someone_won {
            print("Congratulations " + String(gameObject.typeIndex(sender.tag)) + ", you won!")
            game += 1
            if game == 1 {
                restartGame()
            }
        }
        else if gameState == OXGame.OXGameState.complete_no_one_won {
            print("The game was tied")
            restartGame()
        }
        else {
            print("game still ongoing")
        }
    }
    
    // New Game button is pressed
    @IBAction func NewGameCreated(sender: AnyObject) {
        restartGame()
    }
    
    // function that restarts game
    func restartGame(){
        gameObject.reset()
        
        // self.BoardView.subviews
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

}
