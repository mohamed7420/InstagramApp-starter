//
//  StoryCollectionViewCell.swift
//  InstagramApp
//
//  Created by Mohamed on 12/2/19.
//  Copyright © 2019 Gwinyai Nyatsoka. All rights reserved.
//

import UIKit

class StoryCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var storyImageView: UIImageView!
    
    @IBOutlet weak var userNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        storyImageView.layer.cornerRadius = storyImageView.frame.height / 2
        storyImageView.layer.borderColor = UIColor.white.cgColor
        storyImageView.layer.borderWidth = CGFloat(3.0)
    }

}
