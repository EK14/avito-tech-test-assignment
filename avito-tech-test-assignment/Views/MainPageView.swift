//
//  MainPageView.swift
//  avito-tech-test-assignment
//
//  Created by Элина Карапетян on 27.08.2023.
//

import UIKit

protocol MainPageViewProtocol: UIView{
    func didLoad()
    func reloadData()
}

class MainPageView: UIView {
    
    weak var delegate: MainPageViewControllerDelegate?
    private var collectionView: UICollectionView!
    
    private func setupCollectionView(){
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 10
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(ItemCollectionViewCell.self, forCellWithReuseIdentifier: "item")
        collectionView.dataSource = delegate
        collectionView.delegate = delegate
        
        //Setting up CollectionView constraints
        addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: self.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
        
    }

    
}

extension MainPageView: MainPageViewProtocol{
    func didLoad() {
        setupCollectionView()
    }
    
    func reloadData(){
        collectionView.reloadData()
    }
}
