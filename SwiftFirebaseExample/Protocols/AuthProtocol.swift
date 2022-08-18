//
//  AuthProtocol.swift
//  SwiftFirebaseExample
//
//  Created by Mustafa Ali DİKÇINAR on 18.08.2022.
//

import Foundation


protocol AuthProtocol{
    func signInWithEmailPassword(email:String, password:String, onError:((String) -> Void)?, onSuccess:(() -> Void)?)
    func signOut() throws
}
