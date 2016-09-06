//
//  PageCell.swift
//  AudibleExample
//
//  Created by Dante Solorio on 9/6/16.
//  Copyright © 2016 Dante Solorio. All rights reserved.
//

import UIKit

class PageCell: UICollectionViewCell{
    
    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .ScaleAspectFill
        iv.backgroundColor = .yellowColor()
        iv.image = UIImage(named: "page1")
        iv.clipsToBounds = true
        return iv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setupView(){
        addSubview(imageView)
        
        imageView.anchorToTop(topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor)
    }
}
