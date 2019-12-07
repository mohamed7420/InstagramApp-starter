//
//  SearchViewController.swift
//  InstagramApp
//
//  Created by Mohamed on 11/29/19.
//  Copyright © 2019 Gwinyai Nyatsoka. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var searchController: UISearchController!
    
    lazy var posts: [Post] = {
       
        let model = Model()
        
        return model.postList
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

            
        collectionView.delegate = self
        
        collectionView.dataSource = self
    
        searchController = UISearchController(searchResultsController: nil)
        
        searchController.obscuresBackgroundDuringPresentation = true
        
        searchController.searchBar.showsCancelButton = false
        
    
        for subView in searchController.searchBar.subviews{
            
        for subView1 in subView.subviews{
            
            if let textField = subView1 as? UITextField {
                
                textField.backgroundColor = UIColor(red: 0.93, green: 0.93, blue: 0.93 , alpha: 1.0)
                
                textField.textAlignment = NSTextAlignment.center
                
            }
                
        }
        
    }

        searchController.dimsBackgroundDuringPresentation = false
        searchController.definesPresentationContext = true
        searchController.hidesNavigationBarDuringPresentation = false
        
        let searchContainer = SearchBarContainerView(customSearchView: searchController.searchBar)
        
        searchContainer.frame = CGRect(x: 0, y: 0, width: collectionView.frame.width, height: 44)
    
    
        navigationItem.titleView = searchContainer
        
    }
    


}


extension SearchViewController : UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return posts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SearchCustomCell", for: indexPath) as! SearchCustomCell
        
        cell.imageSearchView.image = posts[indexPath.row].postImage
        
        return cell
    
    }
    
    
    
    
    
}
