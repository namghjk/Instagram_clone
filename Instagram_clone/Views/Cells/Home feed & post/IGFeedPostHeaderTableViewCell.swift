//
//  IGFeedPostHeaderTableViewCell.swift
//  Instagram_clone
//
//  Created by namghjk on 05/08/2022.
//

import UIKit

class IGFeedPostHeaderTableViewCell: UITableViewCell {
    
    static let identifier = "IGFeedPostHeaderTableViewCell"

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(){
        //configure the cell
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
}
