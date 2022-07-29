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
    
    public func registerNewUser(username: String, email: String, password: String, completion:@escaping(Bool) -> Void){
        
        /*
         - check if username is available
         - check if email is available
         */
        DatabaseManager.shared.canCreateUser(with: email, username: username, password: password){ canCreate in
            if canCreate{
//                - create account
//                - insert account to database
                Auth.auth().createUser(withEmail: email, password: password) { result, error in
                    if error == nil, result != nil {
                        //Firebase auth could not create an account
                        completion(false)
                        return
                    }
                    
                    // insert database
                    DatabaseManager.shared.insertNewUser(with: email, username: username){ inserted in
                        if inserted {
                            completion(true)
                            return
                        } else {
                            //failed to insert database
                            completion(false)
                            return
                        }
                    }
                }
            }
            
            else{
                //either username or email does not exist
                completion(false)
            }
            
        }
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

