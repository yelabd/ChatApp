//
//  LoginViewController.swift
//  ChatApp
//
//  Created by Youssef Elabd on 2/23/17.
//  Copyright © 2017 Youssef Elabd. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailTextFiels: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onSignUp(_ sender: Any) {
        var user = PFUser()
        //        user.username = emailTextFiels.text
        user.password = passwordTextField.text
        user.username = emailTextFiels.text
        // other fields can be set just like with PFObject
        //        user["phone"] = "415-392-0202"
        user.signUpInBackground { (success: Bool, error: Error?) in
            if let error = error {
                let errorString = error.localizedDescription
                print(errorString)
                // Show the errorString somewhere and let the user try again.
            } else {
                print("yes")
                // Hooray! Let them use the app now.
            }
            
        }
        
    }
    @IBAction func onLogin(_ sender: Any) {
        let password = passwordTextField.text
        let username = emailTextFiels.text
        
        PFUser.logInWithUsername(inBackground: username!, password: password!) { (user, error) in
            if let error = error {
                print(error)
            }else{
                self.performSegue(withIdentifier: "chatView", sender: nil)
            }
        }
    }
    
    //    func onSignUpd() {
    //        var user = PFUser()
    //        //        user.username = emailTextFiels.text
    //        user.password = passwordTextField.text
    //        user.email = emailTextFiels.text
    //        // other fields can be set just like with PFObject
    //        //        user["phone"] = "415-392-0202"
    //        user.signUpInBackground { (success: Bool, error: Error?) in
    //            if let error = error {
    //                let errorString = error.localizedDescription
    //                print(errorString)
    //                // Show the errorString somewhere and let the user try again.
    //            } else {
    //                print("yes")
    //                // Hooray! Let them use the app now.
    //            }
    //
    //        }
    //    }
    //
    //    func onLogind(){
    //
    //        //        user.username = emailTextFiels.text
    //                // other fields can be set just like with PFObject
    //        //        user["phone"] = "415-392-0202"
    //        let password = passwordTextField.text
    //        let username = emailTextFiels.text
    //
    //        PFUser.logInWithUsername(inBackground: username!, password: password!) { (user, error) in
    //            if let error = error {
    //                print(error)
    //            }else{
    //                self.performSegue(withIdentifier: "chatView", sender: <#T##Any?#>)
    //            }
    //        }
    //
    //
    //    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
