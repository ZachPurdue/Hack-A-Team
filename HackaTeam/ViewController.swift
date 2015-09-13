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


//    @IBAction func signIn(sender: UIButton) {
//        let ref = Firebase(url: "https://hackateam.firebaseio.com/")
//        ref.authUser(email.text, password: password.text,
//            withCompletionBlock: { error, authData in
//                if error != nil {
//                    // There was an error logging in to this account
//                    
//
//                } else {
//                    // We are now logged in
//                    print("Log in successful")
//                }
//        })
//    }
    
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

