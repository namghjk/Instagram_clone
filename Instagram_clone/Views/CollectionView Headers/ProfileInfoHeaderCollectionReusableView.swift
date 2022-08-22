//
//  ProfileInfoHeaderCollectionReusableView.swift
//  Instagram_clone
//
//  Created by namghjk on 13/08/2022.
//

import UIKit

class ProfileInfoHeaderCollectionReusableView: UICollectionReusableView {
        static let identifier = "ProfileInfoHeaderCollectionReusableView"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBlue
        clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
