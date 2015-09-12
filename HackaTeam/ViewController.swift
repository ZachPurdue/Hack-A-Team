//
//  ViewController.swift
//  HackaTeam
//
//  Created by William Huang on 9/12/15.
//  Copyright (c) 2015 William Huang. All rights reserved.
//

import Firebase
import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!


    @IBAction func signIn(sender: UIButton) {
        let ref = Firebase(url: "https://hackateam.firebaseio.com/")
        ref.authUser(email.text, password: password.text,
            withCompletionBlock: { error, authData in
                if error != nil {
                    // There was an error logging in to this account
                    

                } else {
                    // We are now logged in
                    print("Log in successful")
                }
        })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var myRootRef = Firebase(url:"https://hackateam.firebaseio.com/")
        var alanisawesome = ["full_name": "Alan Turing", "date_of_birth": "June 23, 1912"]
        var gracehop = ["full_name": "Grace Hopper", "date_of_birth": "December 9, 1906"]
        
        var usersRef = myRootRef.childByAppendingPath("users")
        
        var users = []
        usersRef.setValue(users)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

