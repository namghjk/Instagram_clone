//
//  UserFollowTableViewCell.swift
//  Instagram_clone
//
//  Created by namghjk on 26/08/2022.
//

import UIKit

protocol UserFollowTableViewCellDelegate: AnyObject{
    func didTapFollowUnfollowButton(model: String)
}

class UserFollowTableViewCell: UITableViewCell {
    
    static let identifier =  "UserFollowTableViewCell"
    
    weak var delegate: UserFollowTableViewCellDelegate?

    private let profileImageView: UIImageView = {
       let imagView = UIImageView()
        imagView.contentMode = .scaleAspectFit
       return imagView
    }()
    
    private let nameLabel : UILabel = {
      let label = UILabel()
        label.numberOfLines = 1
        label.font = .systemFont(ofSize: 17, weight: .semibold)
      return label
    }()
    
    private let userNameLabel : UILabel = {
      let label = UILabel()
        label.numberOfLines = 1
        label.font = .systemFont(ofSize: 16, weight: .semibold)
      return label
    }()
    
    private let followButton : UIButton = {
      let button = UIButton()
      return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.clipsToBounds = true
        contentView.addSubview(profileImageView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(userNameLabel)
        contentView.addSubview(followButton)
    
    }
    
    public func configure(with model: String){
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        profileImageView.image = nil
        nameLabel.text = nil
        userNameLabel.text = nil
        followButton.setTitle(nil, for: .normal)
        followButton.backgroundColor = nil
        followButton.layer.borderWidth = 0
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
