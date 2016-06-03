//
//  NetworkPlayViewController.swift
//  NoughtsAndCrosses
//
//  Created by Ryan Davey on 6/3/16.
//  Copyright © 2016 Julian Hulme. All rights reserved.
//

import UIKit

class NetworkPlayViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var gamesList: [OXGame] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gamesList = OXGameController.sharedInstance.getListOfGames()!
        
        self.title = "Network Play"
        networkTableView.delegate = self
        networkTableView.dataSource = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var networkTableView: UITableView!
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let bvc = BoardViewController(nibName: "BoardViewController", bundle: nil)
        bvc.networkGame = true
        self.navigationController?.pushViewController(bvc, animated: true)
        print("did select row \(indexPath.row)")
        
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gamesList.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = "\(OXGameController.sharedInstance.gameList![indexPath.row]))"
        return cell
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Available Online Games"
    }
    
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.navigationBarHidden = false
    }
}
