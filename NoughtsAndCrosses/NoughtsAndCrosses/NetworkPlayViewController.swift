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
    
    var refreshControl: UIRefreshControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gamesList = OXGameController.sharedInstance.getListOfGames()!
        
        self.title = "Network Play"
        networkTableView.delegate = self
        networkTableView.dataSource = self
        // Do any additional setup after loading the view.
        
        refreshControl = UIRefreshControl()
        refreshControl.attributedTitle = NSAttributedString(string: "Release to refresh")
        refreshControl.addTarget(self, action: "refreshTable", forControlEvents: UIControlEvents.ValueChanged)
        networkTableView.addSubview(refreshControl)
    }

    func refreshTable () {
        self.gamesList = OXGameController.sharedInstance.getListOfGames()!
        networkTableView.reloadData()
        refreshControl.endRefreshing()
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
        OXGameController.sharedInstance.acceptGameWithId(gamesList[indexPath.row].gameId!)
        
    }
    
    @IBAction func networkGameTapped(sender: UIButton) {
    }
    
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gamesList.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = "\(OXGameController.sharedInstance.gameList![indexPath.row].gameId!)" + "   " + "\(OXGameController.sharedInstance.gameList![indexPath.row].hostUser!)"
        return cell
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Available Online Games"
    }
    
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.navigationBarHidden = false
        self.gamesList = OXGameController.sharedInstance.getListOfGames()!
        self.networkTableView.reloadData()
    }
}
