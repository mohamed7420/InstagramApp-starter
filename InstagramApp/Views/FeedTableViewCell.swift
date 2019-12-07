//
//  FeedTableViewCell.swift
//  InstagramApp
//
//  Created by Mohamed on 12/2/19.
//  Copyright © 2019 Gwinyai Nyatsoka. All rights reserved.
//

import UIKit

class FeedTableViewCell: UITableViewCell {

    //MARK:- IBOutlets
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var userName: UIButton!
    @IBOutlet weak var postImage: UIImageView!
    @IBOutlet weak var likesLabel: UILabel!
    @IBOutlet weak var commentLabel: UILabel!
    @IBOutlet weak var postTime: UILabel!
    @IBOutlet weak var viewAllComments: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
        profileImageView.layer.cornerRadius = profileImageView.frame.height / 2
        
        profileImageView.clipsToBounds = true
        
        selectionStyle = UITableViewCell.SelectionStyle.none
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
    //MARK:- IBActions
    
    @IBAction func more_icon_buttonTapped(_ sender: UIButton) {
        
    }
    
    @IBAction func likeButtonTapped(_ sender: UIButton) {
    
    }
    
    @IBAction func commentButtonTapped(_ sender: UIButton) {
        
    }
    
    @IBAction func shareButtonTapped(_ sender: UIButton) {
    
    }
    
    
    @IBAction func viewAllCommentButtonTapped(_ sender: UIButton) {
        
        
    }
}
