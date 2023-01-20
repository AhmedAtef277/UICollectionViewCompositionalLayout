//
//  NatureCollectionViewCell.swift
//  UICollectionViewCompositionalLayout
//
//  Created by mac on 20/01/2023.
//

import UIKit

class NatureCollectionViewCell: UICollectionViewCell {
   static let identifier = String(describing : NatureCollectionViewCell.self)
    @IBOutlet private weak var natureImageView: UIImageView!
    func configure(image : UIImage){
        natureImageView.image = image
    }

}
