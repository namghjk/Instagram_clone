//
//  NotificationsViewController.swift
//  Instagram_clone
//
//  Created by namghjk on 22/07/2022.
//

import UIKit

class NotificationsViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
   
    
    private let tableView : UITableView = {
        let tableView = UITableView()
        tableView.isHidden = false
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()
    
    private let spinner : UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView(style: .large)
        spinner.hidesWhenStopped = true
        spinner.tintColor = .label
        return spinner
    }()
    
    private lazy var noNotifications = NoNotificationsView()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Notifications"
        view.backgroundColor = .systemBackground
        view.addSubview(spinner)
        spinner.startAnimating()
        view.addSubview(noNotifications)
        tableView.dataSource = self
        tableView.delegate = self
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
        spinner.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        spinner.center = view.center
        noNotifications.frame = CGRect(x: -100, y: -100, width: view.width, height: view.width/4)
        
    }
    
    private func addNoNotificationsView(){
        tableView.isHidden = true
        view.addSubview(tableView)
        noNotifications.frame = CGRect(x: 0, y: 0, width: view.width, height: view.width/4)
        noNotifications.center = view.center
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        return cell
    }
    
   
   
    

    
}
