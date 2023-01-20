//
//  CompositionalLayout.swift
//  UICollectionViewCompositionalLayout
//
//  Created by mac on 20/01/2023.
//

import Foundation
import UIKit

enum CompositionalLayoutAlignment {
    case horizontal
    case vertical
}

class CompositionalLayout {
    static func createItem(width : NSCollectionLayoutDimension , height : NSCollectionLayoutDimension , space : CGFloat) -> NSCollectionLayoutItem{
        let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: width, heightDimension: height))
        item.contentInsets = NSDirectionalEdgeInsets(top: space, leading: space, bottom: space, trailing: space)
        return item
    }
    
    static func createGroup(alignment : CompositionalLayoutAlignment ,
                            width : NSCollectionLayoutDimension ,
                            height : NSCollectionLayoutDimension ,
                            item : NSCollectionLayoutItem ,
                            count : Int) -> NSCollectionLayoutGroup{
        let group : NSCollectionLayoutGroup!
        switch alignment {
        case .horizontal:
             group = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: width, heightDimension: height), subitem: item , count: count)
        case .vertical:
             group = NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(widthDimension: width, heightDimension: height), subitem: item , count: count)
        }
        
        return group
    }
    
    
    static func createGroup(alignment : CompositionalLayoutAlignment ,
                            width : NSCollectionLayoutDimension ,
                            height : NSCollectionLayoutDimension ,
                            items : [NSCollectionLayoutItem] ) -> NSCollectionLayoutGroup {
        
        switch alignment {
        case .horizontal:
             return NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: width, heightDimension: height), subitems: items)
        case .vertical:
            
            return NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(widthDimension: width, heightDimension: height),subitems: items)
        }
        
    }
}
