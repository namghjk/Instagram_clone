//
//  NotificationsViewController.swift
//  Instagram_clone
//
//  Created by namghjk on 22/07/2022.
//

import UIKit

enum UserNotificationType{
    case like(post: UserPost)
    case follow
}

struct UserNotification{
    let type: UserNotificationType
    let text: String
    let user: User
    
}

final class NotificationsViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
   
    
    private let tableView : UITableView = {
        let tableView = UITableView()
        tableView.isHidden = false
        tableView.register(NotificationLikeEventTableViewCell.self, forCellReuseIdentifier: NotificationLikeEventTableViewCell.identifier)
        tableView.register(NotificationFollowEventTableViewCell.self, forCellReuseIdentifier: NotificationFollowEventTableViewCell.identifier)
        return tableView
    }()
    
    private let spinner : UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView(style: .large)
        spinner.hidesWhenStopped = true
        spinner.tintColor = .label
        return spinner
    }()
    
    private lazy var noNotifications = NoNotificationsView()
    
    private var models = [UserNotification]()
    
    
    //MARK: -life cycle
    

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchNotifications()
        navigationItem.title = "Notifications"
        view.backgroundColor = .systemBackground
        view.addSubview(spinner)
        //spinner.startAnimating()
        view.addSubview(noNotifications)
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self        
    }
    
    
    private func fetchNotifications(){
        for x in 0...100{
            
            let post = UserPost(identifier: "",
                                postType: .photo,
                                thumbnailImage: URL(string: "https://www.google.com.vn/")!,
                                postURL: URL(string: "https://www.google.com.vn/")!,
                                caption: nil,
                                likeCount: [],
                                comments: [],
                                createdDate: Date(),
                                taggedUsers: [])
            
            let model = UserNotification(type: x % 2 == 0 ? .like(post: post) : .follow,
                                         text: "Hello world",
                                         user: User(username: "Nam",
                                                    bio: "",
                                                    name: (first: "", last:""),
                                                    profilePhoto: URL(string: "https://www.google.com.vn/")!,
                                                    birthDate: Date(),
                                                    gender: .male,
                                                    counts: UserCount(followers: 1, following: 1, posts: 1),
                                                    joinDate: Date()))
            models.append(model)
        }
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
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.row]
        switch model.type{
        case .like(_):
            //like cell
            let cell = tableView.dequeueReusableCell(withIdentifier: NotificationLikeEventTableViewCell.identifier, for: indexPath) as! NotificationLikeEventTableViewCell
            cell.configure(with: model)
            return cell
        case .follow:
            //follow cell
            let cell = tableView.dequeueReusableCell(withIdentifier: NotificationFollowEventTableViewCell.identifier, for: indexPath) as! NotificationFollowEventTableViewCell
            cell.configure(with: model)
            return cell
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        return cell
    }
    
   
   
    

    
}
