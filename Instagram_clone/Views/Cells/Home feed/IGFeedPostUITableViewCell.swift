//
//  IGFeedPostUITableViewCell.swift
//  Instagram_clone
//
//  Created by namghjk on 04/08/2022.
//

import UIKit

final class IGFeedPostUITableViewCell: UITableViewCell {
    
    static let identifier = "IGFeedPostUITableViewCell"

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(){
        
    }
}
