//
//  NewPostPageViewController.swift
//  InstagramApp
//
//  Created by Mohamed on 12/7/19.
//  Copyright © 2019 Gwinyai Nyatsoka. All rights reserved.
//

import UIKit

@available(iOS 13.0, *)
class NewPostPageViewController: UIPageViewController  , UIPageViewControllerDelegate{

    var orderedViewController:[UIViewController] = [UIViewController]()
    
    var pagesToShow: [NewPostPagesToShow] = NewPostPagesToShow.pagesToShow()
    
    var currentIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        delegate = self

    }
    
    
    
    private func newViewContrller(pagesToShow: NewPostPagesToShow)-> UIViewController{
        
        var viewController: UIViewController!
        
        let newPostStoryboard = UIStoryboard.init(name: "NewPost", bundle: nil)
        
        switch pagesToShow {
        case .camera:
            
            viewController = newPostStoryboard.instantiateViewController(identifier: pagesToShow.identifier) as! CameraViewController
        case .library:
            
            viewController = newPostStoryboard.instantiateViewController(identifier: pagesToShow.identifier) as! PhotoLibraryViewController
        }
        
        return viewController
    }


    func showViewController(index: Int){
        
        
    }
    
}
