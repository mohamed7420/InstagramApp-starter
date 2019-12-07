//
//  CustomCollectionFlowLayout.swift
//  InstagramApp
//
//  Created by Mohamed on 12/3/19.
//  Copyright © 2019 Gwinyai Nyatsoka. All rights reserved.
//

import Foundation
import UIKit


class CustomCollectionFlowLayout : UICollectionViewLayout{
    
    // specify number of columns
    fileprivate var numberOfColumns: Int = 3
    
    // cell padding
    fileprivate var cellPadding: CGFloat = 3
    
    //Cache
    fileprivate var cache = [UICollectionViewLayoutAttributes]()
    
    fileprivate var contentWidth: CGFloat {
        
        guard let collectionView = collectionView else { return 0 }
        
        let insets = collectionView.contentInset
        
        return collectionView.bounds.width - (insets.right + insets.left) - (cellPadding * (CGFloat(numberOfColumns) - 1))
        
    }
    
    fileprivate var contentHeight: CGFloat = 0
    
    override var collectionViewContentSize: CGSize {
        
        
        return CGSize(width: contentWidth, height: contentHeight)
    }
    
    override func prepare() {
        
        guard cache.isEmpty == true , let collectionView = collectionView else {return}
        
        
        let itemsPerRow: Int = 3
        
        let normalColumnWidth: CGFloat = contentWidth / CGFloat(numberOfColumns)
        
        let normalColumnHeight: CGFloat = normalColumnWidth
        
        let featuredColumnWidth: CGFloat = (normalColumnWidth * 2) + cellPadding
        
        let featuredColumnHeight: CGFloat = (normalColumnWidth * 2) + cellPadding
        
        var xOffsets: [CGFloat] = [CGFloat]()
    
        for item in 0..<6{
            
            let multiplier = item % 3
            
            let xPos = CGFloat(multiplier) * (normalColumnWidth + cellPadding)
            
            xOffsets.append(xPos)
            
        }
        
        xOffsets.append(0.0)
        
        for _ in 0..<2{
            
            xOffsets.append(featuredColumnWidth + cellPadding)
            
        }
        
        var yOffsets: [CGFloat] = [CGFloat]()
        
        for item in 0..<9{
            
            var _yPos = floor(Double(item / 3)) * (Double(normalColumnHeight) + Double(cellPadding))
            
            if item == 8{
                
                _yPos += (Double(normalColumnHeight) + Double(cellPadding))
            }
            
            yOffsets.append(CGFloat(_yPos))
        }
        
        let numberOfItemsPerSeaction: Int = 9
        
        let heightOfSection: CGFloat = 4 * normalColumnHeight + (4 * cellPadding)
        
        var itemInSection: Int = 0
        
        for item in 0..<collectionView.numberOfItems(inSection: 0){
            
            let indexPath = IndexPath(item: item, section: 0)
            
            let xPos = xOffsets[itemInSection]
            
            let multiplier: Double = floor(Double(item) / Double(numberOfItemsPerSeaction))
            
            let yPos = yOffsets[itemInSection] + (heightOfSection * CGFloat(multiplier))
            
            var cellWidth = normalColumnWidth
            
            var cellHeight = normalColumnHeight
            
            if (itemInSection + 1) % 7 == 0 && itemInSection != 0 {
                
                cellWidth = featuredColumnWidth
                
                cellHeight = featuredColumnHeight
            }
            
            let frame = CGRect(x: xPos, y: yPos, width: cellWidth, height: cellHeight)
            
            let attributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)
            
            attributes.frame = frame
            
            cache.append(attributes)
            
            contentHeight = max(contentHeight, frame.maxY)
            
            itemInSection = itemInSection < (numberOfItemsPerSeaction - 1) ? (itemInSection + 1) : 0
        }
        
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        
        var visibleLayoutAttribute = [UICollectionViewLayoutAttributes]()
        
        for attributes in cache {
            
            if attributes.frame.intersects(rect){
                
                visibleLayoutAttribute.append(attributes)
                
            }
        }
        
        return visibleLayoutAttribute
    }
    
    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        
        return cache[indexPath.item]
    }
    
}
