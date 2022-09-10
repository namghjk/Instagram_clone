//
//  ViewController.swift
//  Instagram_clone
//
//  Created by namghjk on 22/07/2022.
//


import FirebaseAuth
import UIKit

struct HomeFeedRenderViewModel{
    let header: PostRenderViewModel
    let posts: PostRenderViewModel
    let actions: PostRenderViewModel
    let comments: PostRenderViewModel
}

class HomeViewController: UIViewController {
    
    private var feedRenderModels = [HomeFeedRenderViewModel]()
    
    private let tableView : UITableView = {
        let tableView = UITableView()
        //register the cell for tableview
        tableView.register(IGFeedPostHeaderTableViewCell.self,
                           forCellReuseIdentifier:  IGFeedPostHeaderTableViewCell.identifier)
        tableView.register(IGFeedPostGeneralTableViewCell.self,
                           forCellReuseIdentifier: IGFeedPostGeneralTableViewCell.identifier)
        tableView.register(IGFeedPostActionsTableViewCell.self,
                           forCellReuseIdentifier: IGFeedPostActionsTableViewCell.identifier)
        tableView.register(IGFeedPostTableViewCell.self,
                           forCellReuseIdentifier: IGFeedPostTableViewCell.identifier)
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        handleNotAuthenticated()
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
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

extension HomeViewController:UITableViewDelegate,UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: IGFeedPostTableViewCell.identifier, for: indexPath) as!
            IGFeedPostTableViewCell
        return cell
    }
    
    
}


