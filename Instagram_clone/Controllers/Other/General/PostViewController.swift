//
//  PostViewController.swift
//  Instagram_clone
//
//  Created by namghjk on 22/07/2022.
//

/*
 Section:
  - Header model
 Section:
  - Post cell model
 Section:
  - Action button cell model
 Section:
  - n number of general models for comments
 */

///states of a rendered cell
enum PostRenderType {
    case header(provider: User)
    case primaryContent(provider: UserPost)//post
    case actions(provider: String) //like, comment, share
    case comments(comments: [PostComment])
}

//Model of rendered post
struct PostRenderViewModel{
    let renderType: PostRenderType
}


import UIKit

class PostViewController: UIViewController {
    
    private let model: UserPost?
    
    private var renderModels = [PostRenderViewModel]()
    
    private let tableView : UITableView = {
        let tableView = UITableView()
        
        //register the cell for tableview
        tableView.register(IGFeedPostUITableViewCell.self,
                           forCellReuseIdentifier: IGFeedPostUITableViewCell.identifier)
        tableView.register(IGFeedPostHeaderTableViewCell.self,
                           forCellReuseIdentifier: IGFeedPostHeaderTableViewCell.identifier)
        tableView.register(IGFeedPostActionsTableViewCell.self,
                           forCellReuseIdentifier: IGFeedPostActionsTableViewCell.identifier)
        tableView.register(IGFeedPostGeneralTableViewCell.self,
                           forCellReuseIdentifier: IGFeedPostGeneralTableViewCell.identifier)
        
        
        return tableView
        
    }()
    
    //MARK: -init
    
    init (model: UserPost?){
        self.model = model
        super.init(nibName: nil, bundle: nil)
        configureModels()
    }
   
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func configureModels(){
        guard let userPostModel  = self.model else {
            return
        }
        
        //Header
        renderModels.append(PostRenderViewModel(renderType: .header(provider: userPostModel.owner)))
        
        //Post
        renderModels.append(PostRenderViewModel(renderType: .primaryContent(provider: userPostModel)))
                                               
        //Actions
        renderModels.append(PostRenderViewModel(renderType: .actions(provider: "")))
        
        //4 comments
        var comments = [PostComment]()
        for x in 0..<4 {
            comments.append(
                PostComment(identifier: "123_\(x)",
                            username: "@Hieu",
                            text: "Greate Post!",
                            createdDate: Date(),
                            likes: []
                 )
            )
            
        }
        renderModels.append(PostRenderViewModel(renderType: .comments(comments: comments)))
                                               
                                               
    }
    
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        view.backgroundColor = .systemBackground
        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
 
}

extension PostViewController : UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return renderModels.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch renderModels[section].renderType{
        case.actions(_): return 1
        case.comments(let comments): return comments.count > 4 ? 4 : comments.count
        case.header(_): return 1
        case.primaryContent(_): return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = renderModels[indexPath.section]
        
        switch model.renderType {
            
        case.actions(let actions):
            let cell = tableView.dequeueReusableCell(withIdentifier: IGFeedPostActionsTableViewCell.identifier, for: indexPath) as! IGFeedPostActionsTableViewCell
            return cell
            
        case.comments(let comments):
            let cell = tableView.dequeueReusableCell(withIdentifier: IGFeedPostGeneralTableViewCell.identifier, for: indexPath) as! IGFeedPostGeneralTableViewCell
            return cell
            
        case.header(let user):
            let cell = tableView.dequeueReusableCell(withIdentifier: IGFeedPostHeaderTableViewCell.identifier, for: indexPath) as! IGFeedPostHeaderTableViewCell
            return cell
            
        case.primaryContent(let post):
            let cell = tableView.dequeueReusableCell(withIdentifier: IGFeedPostUITableViewCell.identifier, for: indexPath) as! IGFeedPostUITableViewCell
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let model = renderModels[indexPath.section]
        switch model.renderType {
        case.actions(_): return 60
        case.comments(_): return 50
        case.primaryContent(_): return tableView.width
        case.header(_): return 70
        }
        
    }
}
