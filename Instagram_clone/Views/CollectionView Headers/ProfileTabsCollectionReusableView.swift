//
//  ProfileTapsCollectionReusableView.swift
//  Instagram_clone
//
//  Created by namghjk on 13/08/2022.
//

import UIKit

protocol ProfileTabsCollectionReusableViewDelegate: AnyObject{
    func didTapGridButtonTab()
    func didTapTaggedButtonTab()

}

class ProfileTabsCollectionReusableView: UICollectionReusableView {
        static let identifier = "ProfileTapsCollectionReusableView"
    
    public weak var delegate: ProfileTabsCollectionReusableViewDelegate?
    
    private let gridButton: UIButton = {
        let button = UIButton()
        button.clipsToBounds = true
        button.tintColor = .systemBlue
        button.setBackgroundImage(UIImage(systemName: "square.grid.2x2"), for: .normal)
        return button
    }()
    
    private let taggedButton: UIButton = {
        let button = UIButton()
        button.clipsToBounds = true
        button.tintColor = .secondarySystemBackground
        button.setBackgroundImage(UIImage(systemName: "tag"), for: .normal)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
        addSubview(gridButton)
        addSubview(taggedButton)
        
        gridButton.addTarget(self,
                             action: #selector(didTapGridButton),
                             for: .touchUpInside)
        taggedButton.addTarget(self,
                             action: #selector(didTapTaggedButton),
                             for: .touchUpInside)
    }
    
    @objc private func didTapGridButton(){
        delegate?.didTapGridButtonTab()
    }
    
    @objc private func didTapTaggedButton(){
        delegate?.didTapTaggedButtonTab()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
       //assign frame
        
        let size = height - 4
        let gridButtonX = ((width/2) - size)/2
        gridButton.frame = CGRect(x: gridButtonX,
                                  y: 2,
                                  width: size,
                                  height: size)
        taggedButton .frame = CGRect(x: gridButtonX + width/2,
                                  y: 2,
                                  width: size,
                                  height: size)
        
    }
}
