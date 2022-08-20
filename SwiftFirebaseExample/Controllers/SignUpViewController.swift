//
//  SignUpViewController.swift
//  SwiftFirebaseExample
//
//  Created by Mustafa Ali DİKÇINAR on 18.08.2022.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var confirmPasswordField: UITextField!
    
    let authService: AuthProtocol = AuthService.instance
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnSignUp(_ sender: Any) {
        let emailText = emailField.text
        let passwordText = passwordField.text
        let confirmPasswordText = confirmPasswordField.text

        guard emailText != nil, emailText != "", passwordText != nil, passwordText != "", confirmPasswordText != nil, confirmPasswordText != "" else{
            let errMsg = "Email and password can't be empty!!"
            self.showToast(message: errMsg)
            return
        }
        
        guard passwordText == confirmPasswordText else{
            let errMsg = "Passwords must be same!"
            self.showToast(message: errMsg)
            return
        }
        
        authService.signUp(email: emailText!, password: passwordText!) { error in
            self.showToast(message: error)
        } onSuccess: {
            self.navigationController?.popToRootViewController(animated: true)
        }
        

    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
