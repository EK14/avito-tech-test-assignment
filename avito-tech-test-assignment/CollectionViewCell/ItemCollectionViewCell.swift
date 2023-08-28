//
//  ItemCollectionViewCell.swift
//  avito-tech-test-assignment
//
//  Created by Элина Карапетян on 27.08.2023.
//

import UIKit
import SDWebImage

class ItemCollectionViewCell: UICollectionViewCell {

    private var img = UIImageView()
    
    func setup(item: Item){
        setupImageView(url: item.image_url)
    }
    
    func setupImageView(url: String){
        img.sd_setImage(with: URL(string: url))
        contentView.addSubview(img)
        img.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            img.topAnchor.constraint(equalTo: contentView.topAnchor),
            img.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            img.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            img.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}
