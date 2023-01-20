//
//  UIView+Extension.swift
//  UICollectionViewCompositionalLayout
//
//  Created by mac on 20/01/2023.
//

import Foundation
import UIKit
extension UIView{
    @IBInspectable var cornerRadius : CGFloat{
        get{
            return cornerRadius
        }
        set{
            layer.cornerRadius = newValue
        }
    }
}
