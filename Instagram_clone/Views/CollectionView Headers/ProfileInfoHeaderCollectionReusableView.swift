//
//  ProfileInfoHeaderCollectionReusableView.swift
//  Instagram_clone
//
//  Created by namghjk on 13/08/2022.
//

import UIKit

class ProfileInfoHeaderCollectionReusableView: UICollectionReusableView {
        static let identifier = "ProfileInfoHeaderCollectionReusableView"
    
    private let profilePhotoImageView : UIImageView = {
       let imageView = UIImageView()
       return imageView
    }()
    
    private let postsButton : UIButton = {
       let button = UIButton()
       return button
    }()
    
    private let followingButton : UIButton = {
       let button = UIButton()
       return button
    }()
    
    private let followersButton : UIButton = {
       let button = UIButton()
       return button
    }()
    
    private let editProfileButton : UIButton = {
       let button = UIButton()
       return button
    }()
    
    private let nameLabel : UILabel = {
       let label = UILabel()
       return label
    }()
    
    private let bioLabel : UILabel = {
       let label = UILabel()
       return label
    }()
    
     
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        backgroundColor = .systemBlue
        clipsToBounds = true
    }
    
    private func addSubviews(){
        addSubview(profilePhotoImageView)
        addSubview(followersButton)
        addSubview(followingButton)
        addSubview(postsButton)
        addSubview(nameLabel)
        addSubview(bioLabel)
        addSubview(editProfileButton )
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    
    
}
