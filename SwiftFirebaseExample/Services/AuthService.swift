//
//  AuthService.swift
//  SwiftFirebaseExample
//
//  Created by Mustafa Ali DİKÇINAR on 18.08.2022.
//

import Foundation
import FirebaseAuth

class AuthService: AuthProtocol {

 
    
    static let instance = AuthService()
    
    private init(){}
    
    func signInWithEmailPassword(email: String, password: String, onError:((String) -> Void)? = nil, onSuccess:(() -> Void)? = nil) {
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            guard error == nil else {
                if onError != nil {
                    onError!(error?.localizedDescription ?? "UnkownError")
                }
              return
            }
            if onSuccess != nil {onSuccess!()}
        }
    }
    
    func signOut() throws{
        try Auth.auth().signOut()
    }
}
