//
//  SignUpViewController.swift
//  HackaTeam
//
//  Created by William Huang on 9/12/15.
//  Copyright (c) 2015 William Huang. All rights reserved.
//

import Firebase
import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var emailRepeat: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var passwordRepeat: UITextField!
    @IBOutlet weak var school: UITextField!
    
    func addUser(){
        let ref = Firebase(url: "https://hackateam.firebaseio.com/")
        ref.createUser(email.text, password: password.text,
            withValueCompletionBlock: { error, result in
                if error != nil {
                    // There was an error creating the account
                    print("error creating account")
                } else {
                    let uid = result["uid"] as? String
                    println("Successfully created user account with uid: \(uid)")
                }
        })
    }
    
    @IBAction func create(sender: UIButton) {
//        let ref = Firebase(url: "https://hackateam.firebaseio.com/")
//        var entry = ["name": name.text, "school": school.text]
//        var usersRef = ref.childByAppendingPath("users")
//        var e = email.text
//        var users = [e: entry]
//        usersRef.setValue(users)
        
        
        
        addUser()
        
//        ref.createUser(email.text, password: password.text,
//            withValueCompletionBlock: { error, result in
//                if error != nil {
//                    // There was an error creating the account
//                    print("error creating account")
//                } else {
//                    let uid = result["uid"] as? String
//                    println("Successfully created user account with uid: \(uid)")
//                }
        //})
        
        
        //var entry = ["name": name.text, "school": school.text]
        //var usersRef = ref.childByAppendingPath("users")
        
        //var users = [email.text: entry]
        //usersRef.setValue(users)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
