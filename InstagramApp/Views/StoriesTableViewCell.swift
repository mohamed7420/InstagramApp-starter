//
//  StoriesTableViewCell.swift
//  InstagramApp
//
//  Created by Mohamed on 12/2/19.
//  Copyright © 2019 Gwinyai Nyatsoka. All rights reserved.
//

import UIKit

class StoriesTableViewCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    
    lazy var stories:[Story] = {
       
        let model = Model()
        
        return model.storyList
        
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        selectionStyle = UITableViewCell.SelectionStyle.none
        
        collectionView.register(UINib(nibName: "StoryCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "StoryCollectionViewCell")
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
}

extension StoriesTableViewCell : UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    
        return stories.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StoryCollectionViewCell", for: indexPath) as! StoryCollectionViewCell
        
        cell.storyImageView.image = stories[indexPath.row].post.postImage
        
        cell.userNameLabel.text = stories[indexPath.row].post.user.name
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 90, height: 110)
    }
    
    
}
