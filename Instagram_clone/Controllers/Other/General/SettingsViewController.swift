//
//  SettingsViewController.swift
//  Instagram_clone
//
//  Created by namghjk on 22/07/2022.
//

import SafariServices
import UIKit

struct SettingCellModel{
    let title: String
    let handler: ( ()-> Void)
    
}

/// View controller to show user settings
class SettingsViewController: UIViewController {
    
    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero,
                                    style: .grouped)
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        return tableView
    }()
    
    private var data = [[SettingCellModel]]()

    override func viewDidLoad() {
        super.viewDidLoad()
        configuredModels()
        view.backgroundColor = .systemBackground
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
    }
   
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
       
    }
    
    private func configuredModels(){
        
        data.append([
            
            SettingCellModel(title: "Edit Profile"){ [weak self] in
                self?.didTapEditProfile()
            },
            
            SettingCellModel(title: "Invite Friends"){ [weak self] in
                self?.didTapInviteFriends()
            },
            
            SettingCellModel(title: "Save Origianal Pots"){ [weak self] in
                self?.didTapSaveOriginalPosts()
            }
        ])
    
        data.append([
            SettingCellModel(title: "Terms of Servie"){ [weak self] in
                self?.openURL(type: .terms)
            },
            
            SettingCellModel(title: "Privacy Policy"){ [weak self] in
                self?.openURL(type: .privacy)
            },
            
            SettingCellModel(title: "Help / Feedback"){ [weak self] in
                self?.openURL(type: .help)
            }
            
        ])
        
        data.append([
            SettingCellModel(title: "Log Out"){ [weak self] in
                self?.didTapLogOut()
                }
        ])
      }
    
    enum SettinsgURlType{
        case terms, privacy, help
    }
    
    private func openURL(type: SettinsgURlType){
        let urlString: String
        switch type{
        case .terms: urlString = "https://help.instagram.com/581066165581870"
        case .privacy: urlString = "https://help.instagram.com/196883487377501"
        case .help: urlString = "https://help.instagram.com/"
        }
        
        guard let url = URL(string: urlString) else {
            return
        }
        
        let vc = SFSafariViewController(url: url)
        present(vc, animated: true)
        
    }
    
    private func didTapSaveOriginalPosts(){
        
    }
    
    private func didTapInviteFriends(){
        //show share sheet to invite friends
    }
    
    private func didTapEditProfile(){
        let vc = EditProfileViewController()
        vc.title = "Edit Profile"
        let naVC = UINavigationController(rootViewController: vc)
        naVC.modalPresentationStyle = .fullScreen
        present(naVC, animated: true)
        
    }
    
    private func didTapLogOut(){
        
        let actionSheet = UIAlertController(title: "Log Out",
                                            message: "Are you sure want to log out?",
                                            preferredStyle: .actionSheet)
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        actionSheet.addAction(UIAlertAction(title: "Log Out", style: .destructive, handler: { _ in
            AuthManager.shared.logOut(completion: {success in
                DispatchQueue.main.async {
                    if success {
                        //present login
                        let loginVC = LoginViewController()
                        loginVC.modalPresentationStyle = .fullScreen
                        self.present(loginVC, animated: true) {
                            self.navigationController?.popToRootViewController(animated: false)
                            self.tabBarController?.selectedIndex = 0
                        }
                    } else {
                        //error occured
                        fatalError("Could not log out user")
                    }
                }
            })
        }))
        
        actionSheet.popoverPresentationController?.sourceView = tableView
        actionSheet.popoverPresentationController?.sourceRect = tableView.bounds
        
        
        present(actionSheet, animated: true)
    }

}

extension SettingsViewController:UITableViewDelegate,UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = data[indexPath.section][indexPath.row].title
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let model = data[indexPath.section][indexPath.row]
        model.handler()
    }
}
