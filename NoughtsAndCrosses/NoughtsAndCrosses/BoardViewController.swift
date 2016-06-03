//
//  BoardViewController.swift
//  NoughtsAndCrosses
//
//  Created by Alejandro Castillejo on 5/27/16.
//  Copyright © 2016 Julian Hulme. All rights reserved.
//

import UIKit

class BoardViewController: UIViewController, UIGestureRecognizerDelegate {
    
    var networkGame = false
    
    // variable for starting rotation
    var lastSnap = CGFloat(0)
    
    var gameObject:OXGame = OXGame()
    
    let appDelegate: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.navigationBarHidden = true
        if (networkGame) {
            logoutButton.setTitle("Cancel Game", forState: .Normal)
            newGameButton.hidden = true
            networkPlay.hidden = true
        }
    }
    
    @IBAction func logoutButtonTapped(sender: AnyObject) {
        if (networkGame) {
            self.navigationController?.popViewControllerAnimated(true)
        }
        else {
            appDelegate.navigateToAuthorisationNavigationController()
        }
        
        
    }
    
    // All outlets
    @IBOutlet weak var BoardView: UIView!
   
    @IBOutlet weak var logoutButton: UIButton!
    
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
    
    // Outlet for network play button
    @IBOutlet weak var networkPlay: UIButton!
    
    // Changes to NetworkPlay View Controller
    @IBAction func networkPlayTapped(sender: UIButton) {
        let npc = NetworkPlayViewController(nibName: "NetworkPlayViewController", bundle: nil)
        self.navigationController?.navigationBarHidden = false
        self.navigationController?.pushViewController(npc, animated: true)
    }   
    
    // Outlets for grid buttons
    @IBAction func GridButtonPushed(sender: AnyObject) {
        sender.setTitle(String(gameObject.whosTurn()), forState: .Normal)
        gameObject.playMove(sender.tag)
        
        // gameState stores the state of the game
        let gameState = gameObject.state()
        // game resets the game once a winner has been declared
        var game = 0
        
        // checks if the player who last made the turn won, or if the game ended in a tie/is still ongoing
        if gameState == OXGameState.complete_someone_won {
            print("Congratulations " + String(gameObject.typeIndex(sender.tag)) + ", you won!")
            game += 1
            if game == 1 {
                restartGame()
            }
        }
        else if gameState == OXGameState.complete_no_one_won {
            print("The game was tied")
            restartGame()
        }
        else {
            print("game still ongoing")
        }
    }
    
    // New Game button is pressed
    @IBAction func newGameButton(sender: UIButton) {
    }
    
    @IBOutlet weak var newGameButton: UIButton!
   
    
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

         //create an instance of UIRotationGestureRecognizer
        let rotation: UIRotationGestureRecognizer = UIRotationGestureRecognizer(target: self, action: Selector("handleRotation:"))
        self.BoardView.addGestureRecognizer(rotation)
    }
    
    
    func handleRotation(sender: UIRotationGestureRecognizer? = nil) {
        
        self.BoardView.transform = CGAffineTransformMakeRotation(sender!.rotation + lastSnap)
        if (sender!.state == UIGestureRecognizerState.Ended) {
            print("rotation \(sender!.rotation)")
            if (sender!.rotation > CGFloat(0)) {
                UIView.animateWithDuration(NSTimeInterval(3), animations: {
                    self.BoardView.transform = CGAffineTransformMakeRotation(CGFloat(0))})
                print("clockwise rotation detected")
            }
            else {
                UIView.animateWithDuration(NSTimeInterval(3), animations: {
                    self.BoardView.transform = CGAffineTransformMakeRotation(CGFloat(0))})
                print("counterclockwise rotation detected")
            }
        }
    }
    
    
    
}
//            if (sender!.rotation < CGFLoat(M_PI/4) {
//            // snap action
//            UIView.animateWithDuration(NSTimeInterval(3), animations: {
//            self.BoardView.transform = CGAffineTransformMakeRotation(CGFloat(0))
//        let pinch: UIPinchGestureRecognizer = UIPinchGestureRecognizer(target: self, action: Selector("handlePinch:"))
//        self.BoardView.addGestureRecognizer(pinch)
//    func handlePinch(sender: UIPinchGestureRecognizer? = nil) {
//        print("pinch detected")
//    }
