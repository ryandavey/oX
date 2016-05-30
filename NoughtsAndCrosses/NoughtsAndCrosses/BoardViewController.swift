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
        print(String(sender.tag))
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

}
