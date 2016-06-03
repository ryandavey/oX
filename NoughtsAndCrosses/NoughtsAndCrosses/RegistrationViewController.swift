//
//  RegistrationViewController.swift
//  Onboarding
//
//  Created by Ryan Davey on 5/31/16.
//  Copyright © 2016 Ryan Davey. All rights reserved.
//

import UIKit

class RegistrationViewController: UIViewController {
    
    // Text fields
    @IBOutlet weak var emailField: EmailValidatedTextField!
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Register"
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Action for Register button
    
    @IBAction func registrationButtonTapped(sender: UIButton) {
        
        let email = emailField.text
        let password = passwordField.text
        
        if (emailField.validate()) {
            let (failureMessage, user) = UserController.sharedInstance.registerUser(email!,newPassword:password!)
            if let _ = user {
                print("User registered")
                let appDelegate: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
                NSUserDefaults.standardUserDefaults().setValue("TRUE", forKey: "userIsLoggedIn")
                appDelegate.navigateToLoggedInNavigationController()
                
            }
            else
              if let message = failureMessage {
                print("Failed to gester user: \(message)")
            }
        }
        
        
    }
    

}
