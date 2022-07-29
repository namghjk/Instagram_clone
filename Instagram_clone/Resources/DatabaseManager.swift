//
//  DatabaseManager.swift
//  Instagram_clone
//
//  Created by namghjk on 23/07/2022.
//

import FirebaseDatabase



public class DatabaseManager{
    
    static public let shared = DatabaseManager()
    
    private let database = Database.database(url: "https://instagramtest-d99c1-default-rtdb.asia-southeast1.firebasedatabase.app").reference()
    
    //Mark: -public
    
    
    
//    check username and email is available
//     - Parameters
//        - email: presenting email
//        - username: presenting username
    public func canCreateUser(with email : String, username: String, password: String, completion: (Bool) -> Void){
        completion(true)
        
    }
    
    //    insert new user data to database
    //     - Parameters
    //        - email: presenting email
    //        - username: presenting username
    //        - completion: async call back for result if database entry succed
    public func insertNewUser(with email: String, username:String,completion: @escaping(Bool) -> Void){
        
        let key = email.safeDatabaseKey()
        
        database.child(key).setValue(["username":username]) { error, _ in
            if error == nil{
                //succeeded
                completion(true)
                return
            } else {
                //failed
                completion(false)
                return
            }
            
        }
    }
    
    
    
}
