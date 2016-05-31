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
    // Creates outlets for each individual square
    @IBOutlet weak var Square1Button: UIButton!
    @IBOutlet weak var Square2Button: UIButton!
    @IBOutlet weak var Square3Button: UIButton!
    @IBOutlet weak var Square4Button: UIButton!
    @IBOutlet weak var Square5Button: UIButton!
    @IBOutlet weak var Square6Button: UIButton!
    @IBOutlet weak var Square7Button: UIButton!
    @IBOutlet weak var Square8Button: UIButton!
    @IBOutlet weak var Square9Button: UIButton!
    
    
    // Outlets for grid buttons
    @IBAction func GridButtonPushed(sender: AnyObject) {
        sender.setTitle(String(gameObject.whosTurn()), forState: .Normal)
        gameObject.playMove(sender.tag)
        
        // gameState stores the state of the game
        let gameState = gameObject.state()
        // game resets the game once a winner has been declared
        var game = 0
        
        // checks if the player who last made the turn won, or if the game ended in a tie/is still ongoing
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
    
    // function that restarts game and sets the individual squares to blank
    func restartGame(){
        gameObject.reset()
        
        Square1Button.setTitle("", forState: .Normal)
        Square2Button.setTitle("", forState: .Normal)
        Square3Button.setTitle("", forState: .Normal)
        Square4Button.setTitle("", forState: .Normal)
        Square5Button.setTitle("", forState: .Normal)
        Square6Button.setTitle("", forState: .Normal)
        Square7Button.setTitle("", forState: .Normal)
        Square8Button.setTitle("", forState: .Normal)
        Square9Button.setTitle("", forState: .Normal)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

}
