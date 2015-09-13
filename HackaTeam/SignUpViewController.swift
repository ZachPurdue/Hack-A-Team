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
    var key = ""
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
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
                    
                    let postRef = ref.childByAppendingPath("users")
                    let post1 = ["email": self.email.text, "name": self.name.text, "school": self.school.text]
                    let post1Ref = postRef.childByAutoId()
                    //post1Ref is the key of the entry
                    post1Ref.updateChildValues(post1)
                    
                    
                    self.key =  post1Ref.key
                    
                }
        })
    }
    
    @IBAction func create(sender: UIButton) {
        addUser()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "DismissKeyboard")
        view.addGestureRecognizer(tap)
        // Do any additional setup after loading the view.
    }
    
    func DismissKeyboard(){
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
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
