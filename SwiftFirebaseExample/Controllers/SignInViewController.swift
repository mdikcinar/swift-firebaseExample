//
//  SignInViewController.swift
//  SwiftFirebaseExample
//
//  Created by Mustafa Ali DİKÇINAR on 18.08.2022.
//

import UIKit

class SignInViewController: UIViewController {

    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    let authService: AuthProtocol = AuthService.instance

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func btnSignIn(_ sender: Any) {
        let emailText = emailField.text
        let passwordText = passwordField.text
        guard emailText != nil, emailText != "", passwordText != nil, passwordText != ""  else{
            let errMsg = "Email and password can't be empty!!"
            self.showToast(message: errMsg)
            return
        }
        
        authService.signInWithEmailPassword(email: emailText!,password: passwordText!){ error in
                print("An error accured: \(error)")
            }
             onSuccess: {
                self.tabBarController?.selectedIndex = 0
            }
        
    }
    

}
