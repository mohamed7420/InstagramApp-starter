//
//  NewPostViewController.swift
//  InstagramApp
//
//  Created by Mohamed on 11/29/19.
//  Copyright © 2019 Gwinyai Nyatsoka. All rights reserved.
//

import UIKit

enum NewPostPagesToShow: Int {
    
    case library , camera
    
    var identifier:String{
        
        switch self {
        case .library:
            
            return "PhotoLibraryVC"
            
        case .camera:
            
            return "CameraVC"
        }
        
        
    }
    
    static func pagesToShow()->[NewPostPagesToShow]{
        
        
        return [.library , .camera]
    }
}



class NewPostViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(leftBarItemTapped))
        
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.black]
    }
    
    
    // Hide status bar
    
    override var prefersStatusBarHidden: Bool {
        
        return true
    }

    @objc func leftBarItemTapped(){
        
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func libraryButtonTapped(_ sender: UIButton) {
        
        
        NotificationCenter.default.post(name: NSNotification.Name("newPage"), object: NewPostPagesToShow.library)
    }
    
    @IBAction func cameraButtonTapped(_ sender: UIButton) {
        
        NotificationCenter.default.post(name: NSNotification.Name("newPage"), object: NewPostPagesToShow.camera)
    }
    
}
