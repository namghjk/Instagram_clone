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
    
    private var renderModel = [PostRenderViewModel]()
    
    private let tableView : UITableView = {
        let tableView = UITableView()
        
        //register the cell for tableview
        tableView.register(IGFeedPostUITableViewCell.self, forCellReuseIdentifier: "IGFeedPostUITableViewCell")
        tableView.register(IGFeedPostHeaderTableViewCell.self, forCellReuseIdentifier: "IGFeedPostHeaderTableViewCell")
        tableView.register(IGFeedPostActionsTableViewCell.self, forCellReuseIdentifier: "IGFeedPostActionsTableViewCell")
        tableView.register(IGFeedPostGeneralTableViewCell.self, forCellReuseIdentifier: "IGFeedPostGeneralTableViewCell")
        
        
        return tableView
        
    }()
    
    //MARK: -init
    
    init (model: UserPost?){
        self.model = model
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        tableView.frame = view.bounds
    }
    

    

}

extension PostViewController : UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return renderModel.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch renderModel[section].renderType{
        case.actions(_): return 1
        case.comments(let comments): return comments.count > 4 ? 4 : comments.count
        case.header(_): return 1
        case.primaryContent(_): return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = renderModel[indexPath.section]
        
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
            
        case.primaryContent(let posts):
            let cell = tableView.dequeueReusableCell(withIdentifier: IGFeedPostUITableViewCell.identifier, for: indexPath) as! IGFeedPostUITableViewCell
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
}
