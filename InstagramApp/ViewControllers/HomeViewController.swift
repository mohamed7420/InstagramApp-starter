//
//  HomeViewController.swift
//  InstagramApp
//
//  Created by Mohamed on 11/29/19.


import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    lazy var posts:[Post] = {
        
        let postModel = Model()
        
        return postModel.postList
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.estimatedRowHeight = CGFloat(100.0)
        tableView.rowHeight = UITableView.automaticDimension
        
        tableView.register(UINib(nibName: "FeedTableViewCell", bundle: nil), forCellReuseIdentifier: "FeedTableViewCell")
        
        tableView.register(UINib(nibName: "StoriesTableViewCell", bundle: nil), forCellReuseIdentifier: "StoriesTableViewCell")
        tableView.tableFooterView = UIView()
        
        setupNavigationBarIcon()
        
    }
    

}

extension HomeViewController: UITableViewDelegate , UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return posts.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0{
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "StoriesTableViewCell") as! StoriesTableViewCell
            
            return cell
            
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "FeedTableViewCell") as! FeedTableViewCell
        
        let currentIndex = indexPath.row - 1
        
        let postData = posts[currentIndex]
        
        cell.profileImageView.image = postData.user.profileImage
        
        cell.postImage.image = postData.postImage
        
        cell.postTime.text = postData.datePosted
        
        cell.likesLabel.text = "\(postData.likesCount) likes"
        
        cell.commentLabel.text = postData.postComment
        
        cell.userName.setTitle(postData.user.name, for: .normal)
        
        cell.viewAllComments.setTitle("view all \(postData.commentCount) comments", for: .normal)
        
        return cell
    }
    
    
    @objc func rightButtonItemTapped(){
        
        
    }
    
    func setupNavigationBarIcon(){
        
        var rightBarItemImage = UIImage(named: "send_nav_icon")
        
        rightBarItemImage = rightBarItemImage?.withRenderingMode(.alwaysOriginal)
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: rightBarItemImage, style: .plain, target: self, action: #selector(rightButtonItemTapped))
        
        var leftBarItemImage = UIImage(named: "camera_nav_icon")
        
        leftBarItemImage = leftBarItemImage?.withRenderingMode(.alwaysOriginal)
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: leftBarItemImage, style: .plain, target: self, action: #selector(rightButtonItemTapped))
        
        let profileImageView = UIImageView(image: UIImage(named: "logo_nav_icon"))
        
        self.navigationItem.titleView = profileImageView
        
    }
    
    
}
