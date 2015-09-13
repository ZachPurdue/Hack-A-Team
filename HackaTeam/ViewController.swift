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
    @IBOutlet weak var error: UILabel!

    var loggedIn: Bool = false
    
    @IBAction func signIn(sender: UIButton) {
        let ref = Firebase(url: "https://hackateam.firebaseio.com/")
        ref.authUser(email.text, password: password.text,
            withCompletionBlock: { error, authData in
                if error != nil {
                    // There was an error logging in to this account
                    println("Error in log in")
                    self.error.hidden = false
                    self.email.text = ""
                    self.password.text = ""
                    self.loggedIn = false
                } else {
                    // We are now logged in
                    println("Log in successful")
                    self.loggedIn = true
                    self.performSegueWithIdentifier("SignInSegue", sender: self)
                }
        })

    }
    
    override func shouldPerformSegueWithIdentifier(identifier: String?, sender: AnyObject?) -> Bool {
    
        let performSegue = self.loggedIn
        self.loggedIn = false
        return performSegue
    }
    @IBAction func about(sender: UIButton) {
        performSegueWithIdentifier("AboutSegue", sender: self)
    }
    
    @IBAction func newAccount(sender: UIButton) {
        performSegueWithIdentifier("NewAccountSegue", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "DismissKeyboard")
        view.addGestureRecognizer(tap)
        
    }
    
    func DismissKeyboard(){
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

