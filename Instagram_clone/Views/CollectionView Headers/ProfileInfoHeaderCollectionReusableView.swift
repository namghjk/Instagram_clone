//
//  ProfileInfoHeaderCollectionReusableView.swift
//  Instagram_clone
//
//  Created by namghjk on 13/08/2022.
//

import UIKit

final class ProfileInfoHeaderCollectionReusableView: UICollectionReusableView {
        static let identifier = "ProfileInfoHeaderCollectionReusableView"
    
    private let profilePhotoImageView : UIImageView = {
       let imageView = UIImageView()
        imageView.backgroundColor = .red
        imageView.layer.masksToBounds = true
       return imageView
    }()
    
    private let postsButton : UIButton = {
       let button = UIButton()
        button.backgroundColor = .secondarySystemBackground
        button.setTitleColor(.label, for: .normal)
        button.setTitle("Posts", for: .normal)
       return button
    }()
    
    private let followingButton : UIButton = {
       let button = UIButton()
        button.backgroundColor = .secondarySystemBackground
        button.setTitleColor(.label, for: .normal)
        button.setTitle("Following", for: .normal)
       return button
    }()
    
    private let followersButton : UIButton = {
       let button = UIButton()
        button.backgroundColor = .secondarySystemBackground
        button.setTitleColor(.label, for: .normal)
        button.setTitle("Followers", for: .normal)
       return button
    }()
    
    private let editProfileButton : UIButton = {
       let button = UIButton()
        button.backgroundColor = .secondarySystemBackground
        button.setTitleColor(.label, for: .normal)
        button.setTitle("Edit your profile", for: .normal)
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
        backgroundColor = .systemBackground
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
         
        let profilePhotoSize = width/4
        profilePhotoImageView.frame =  CGRect(x: 5,
                                              y: 5,
                                              width: profilePhotoSize,
                                              height: profilePhotoSize).integral
        profilePhotoImageView.layer.cornerRadius = profilePhotoSize/2
        
        let buttonHeight = profilePhotoSize/2
        let countButtonWidth = (width - 10 - profilePhotoSize)/3
        
        postsButton.frame = CGRect(x: profilePhotoImageView.right,
                                   y: 5,
                                   width: countButtonWidth,
                                   height: buttonHeight)
        
        followersButton.frame = CGRect(x: postsButton.right,
                                   y: 5,
                                   width: countButtonWidth,
                                   height: buttonHeight)
        
        followingButton.frame = CGRect(x: followersButton.right,
                                   y: 5,
                                   width: countButtonWidth,
                                   height: buttonHeight)
        editProfileButton.frame = CGRect(x: profilePhotoImageView.right,
                                   y: 5 + buttonHeight,
                                   width: countButtonWidth*3,
                                   height: buttonHeight)
        
    }
    
    
    
}
