//
//  TabBarDelegateswift.swift
//  InstagramApp
//
//  Created by Mohamed on 12/7/19.
//  Copyright © 2019 Gwinyai Nyatsoka. All rights reserved.
//

import Foundation
import UIKit


class TabBarDelegate : NSObject , UITabBarControllerDelegate{
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        
        let navigation = viewController as? UINavigationController
        
        _ = navigation?.popViewController(animated: false)
        
    }
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        
        let selectedViewController = tabBarController.selectedViewController
        
        guard let _selectedViewController = selectedViewController else {return false}
        
        if viewController == _selectedViewController{return false}
        
        guard let controllerIndex = tabBarController.viewControllers?.firstIndex(of: viewController) else {
            
            return true
        }
        
        if controllerIndex == 2 {
            
            let newPostStoryBoard = UIStoryboard(name: "NewPost", bundle: nil)
            
            if #available(iOS 13.0, *) {
             
                let newPostVC = newPostStoryBoard.instantiateViewController(identifier: "NewPost") as! NewPostViewController
                
                let navigation = UINavigationController(rootViewController: newPostVC)
                
                _selectedViewController.present(navigation, animated: true, completion: nil)
                
                return false
                
                
            }
            
        }
        
        let navigationController = viewController as? UINavigationController
        
        _ = navigationController?.popToRootViewController(animated: false)
        
        
        return true
    }
    
}
