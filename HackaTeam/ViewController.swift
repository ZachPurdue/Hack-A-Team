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

    @IBAction func signUp(sender: UIButton) {
        var ref = Firebase(url:"https://hackateam.firebaseio.com/")
        ref.createUser(email.text, password: password.text,
            withValueCompletionBlock: { error, result in
                if error != nil {
                    // There was an error creating the account
                } else {
                    let uid = result["uid"] as? String
                    println("Successfully created user account with uid: \(uid)")
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

