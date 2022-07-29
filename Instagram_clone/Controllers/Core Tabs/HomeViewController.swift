//
//  ViewController.swift
//  Instagram_clone
//
//  Created by namghjk on 22/07/2022.
//


import FirebaseAuth
import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        handleNotAuthenticated()
        do {
            try Auth.auth().signOut()
        } catch{
            print("failed to sign out")
        }
      
    }
    
    private func handleNotAuthenticated (){
        //check auth
        if Auth.auth().currentUser == nil{
            //show log in
            let loginVC = LoginViewController()
            loginVC.modalPresentationStyle = .fullScreen
            present(loginVC, animated: false)
            
        }
    }


}

