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





import UIKit

class PostViewController: UIViewController {
    
    private let model: UserPost?
    
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
        return 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
}
