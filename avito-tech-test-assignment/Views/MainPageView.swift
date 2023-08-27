//
//  MainPageView.swift
//  avito-tech-test-assignment
//
//  Created by Элина Карапетян on 27.08.2023.
//

import UIKit

protocol MainPageViewProtocol: UIView{
    func didLoad()
}

class MainPageView: UIView {
    
    weak var delegate: MainPageViewControllerDelegate?
    private var collectionView: UICollectionView!
    
    private func setupCollectionView(){
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = true
        collectionView.register(ItemCollectionViewCell.self, forCellWithReuseIdentifier: "item")
        collectionView.dataSource = delegate
        collectionView.delegate = delegate
        
        let topAnchor = collectionView.topAnchor.constraint(equalTo: self.topAnchor)
        topAnchor.priority = UILayoutPriority(rawValue: 999)
        
        let leadingAnchor = collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor)
        leadingAnchor.priority = UILayoutPriority(rawValue: 999)
        
        let trailingAnchor = collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        trailingAnchor.priority = UILayoutPriority(rawValue: 999)
        
        let bottomAnchor = collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        bottomAnchor.priority = UILayoutPriority(rawValue: 999)
    
        addSubview(collectionView)
        NSLayoutConstraint.activate([
            topAnchor,
            leadingAnchor,
            trailingAnchor,
            bottomAnchor
        ])
    }

    
}

extension MainPageView: MainPageViewProtocol{
    func didLoad() {
        setupCollectionView()
    }
}
