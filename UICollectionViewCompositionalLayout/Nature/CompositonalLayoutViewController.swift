//
//  ViewController.swift
//  UICollectionViewCompositionalLayout
//
//  Created by mac on 20/01/2023.
//

import UIKit

class CompositonalLayoutViewController: UIViewController {
    
    @IBOutlet private weak var natureCollectionView: UICollectionView!
    
    private var natureImges : [UIImage] = Array(1 ... 10).map {
        UIImage(named: String($0))!
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        register()
        setupCollectionView()
        natureCollectionView.collectionViewLayout = createLayout()
        
    }
    private func register(){
        natureCollectionView.register(UINib(nibName: NatureCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: NatureCollectionViewCell.identifier)
        
    }
    
    private func setupCollectionView(){
        // natureCollectionView.delegate = self
        natureCollectionView.dataSource = self
        
    }
    
    private func createLayout() -> UICollectionViewCompositionalLayout {
        let fullPhotoItem = CompositionalLayout.createItem(width: .fractionalWidth(1), height: .fractionalHeight(0.25), space: 1)
        
        let mainItem = CompositionalLayout.createItem(width: .fractionalWidth(2/3), height: .fractionalHeight(1), space: 1)
        
        let pairItem = CompositionalLayout.createItem(width: .fractionalWidth(1), height: .fractionalHeight(1/2), space: 1)
        
        let pairItemGroup = CompositionalLayout.createGroup(alignment: .vertical, width: .fractionalWidth(1/3), height: .fractionalHeight(1), item: pairItem, count: 2)
        
        let mainWithPairGroup = CompositionalLayout.createGroup(alignment: .horizontal, width: .fractionalWidth(1), height: .fractionalHeight(0.25), items: [mainItem,pairItemGroup])
        
        let tripleItem = CompositionalLayout.createItem(width: .fractionalWidth(1/3), height: .fractionalHeight(1), space: 1)
        let tripleGroup = CompositionalLayout.createGroup(alignment: .horizontal, width: .fractionalWidth(1), height: .fractionalHeight(0.15), item: tripleItem, count: 3)
        
        let mainWithPairedReversed = CompositionalLayout.createGroup(alignment: .horizontal, width: .fractionalWidth(1), height: .fractionalHeight(0.35), items: [pairItemGroup,mainItem])
        
        let containerGroup =  CompositionalLayout.createGroup(alignment: .vertical, width: .fractionalWidth(1), height: .fractionalHeight(1), items: [fullPhotoItem,mainWithPairGroup , tripleGroup,mainWithPairedReversed])
        
        let section = NSCollectionLayoutSection(group: containerGroup)
        return UICollectionViewCompositionalLayout(section: section)
    }
    
}

extension CompositonalLayoutViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NatureCollectionViewCell.identifier, for: indexPath) as? NatureCollectionViewCell{
            
            cell.configure(image: natureImges[indexPath.row])
            
            return cell
            
        }else{
            return UICollectionViewCell()
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return natureImges.count
    }
    
    
    
    
}

