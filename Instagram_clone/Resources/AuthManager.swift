//
//  AuthManager.swift
//  Instagram_clone
//
//  Created by namghjk on 23/07/2022.
//

import FirebaseAuth

public class AuthManager{
    
    static public let shared = AuthManager()
    
    //Mark: -public
    
    public func registerNewUser(username: String, email: String, password: String){
        
        /*
         - check if username is available
         - check if email is available
         - create account
         - insert account to database
         */
        
    }
    
    public func loginUser(username: String?, email: String?, password:String, completion: @escaping (Bool) ->Void) {
        if let email = email {
            //email login
            Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                guard authResult != nil,error == nil else{
                    completion(false)
                    return
                }
                completion(true)
            }
            
        } else if let username = username {
            print(username)
        }
        
    }
    
}

