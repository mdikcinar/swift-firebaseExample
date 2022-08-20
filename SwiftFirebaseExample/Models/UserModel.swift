//
//  User.swift
//  SwiftFirebaseExample
//
//  Created by Mustafa Ali DİKÇINAR on 18.08.2022.
//

struct UserModel{
    let uuid: String
    let email: String
    
    init(uuid:String, email:String){
        self.uuid = uuid
        self.email = email
    }
}
