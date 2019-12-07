//
//  SearchBarContainerView.swift
//  InstagramApp
//
//  Created by Mohamed on 12/3/19.
//  Copyright © 2019 Gwinyai Nyatsoka. All rights reserved.
//

import UIKit

class SearchBarContainerView: UIView {

    let searchBar: UISearchBar
    
    init(customSearchView: UISearchBar) {
         
        searchBar = customSearchView
        
        super.init(frame: .zero)
        
        addSubview(searchBar)
    
    }
    
    convenience override init(frame: CGRect) {
        
        self.init(customSearchView: UISearchBar())
        
        self.frame = frame
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        
        super.layoutSubviews()
        
        searchBar.frame = bounds
        
    }

}
