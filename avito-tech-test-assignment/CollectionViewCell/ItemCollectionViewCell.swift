//
//  ItemCollectionViewCell.swift
//  avito-tech-test-assignment
//
//  Created by Элина Карапетян on 27.08.2023.
//

import UIKit
import SDWebImage

class ItemCollectionViewCell: UICollectionViewCell {

    private let img = UIImageView()
    private let title = UILabel()
    private let price = UILabel()
    private let location = UILabel()
    private let date = UILabel()
    private let dateFormatter = DateFormatter()
    
    override var isSelected: Bool{
            didSet{
                UIView.animate(withDuration: 0.1, delay: 0.0, options: .curveEaseOut, animations: {
                    self.transform = self.isSelected ? CGAffineTransform(scaleX: 0.95, y: 0.95) : CGAffineTransform.identity
                }, completion: nil)

            }
        }
    
    func setup(item: Item){
        setupImageView(url: item.image_url)
        setupTitle(title: item.title)
        setupPrice(price: item.price)
        setupLocation(location: item.location)
        setupDate(date: item.created_date)
    }
    
    private func setupImageView(url: String){
        img.sd_setImage(with: URL(string: url))
        img.layer.cornerRadius = 5
        img.clipsToBounds = true
        img.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(img)
        
        let imgWidth = img.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 2 - 20)
        imgWidth.priority = UILayoutPriority(rawValue: 999)
        
        let imgHeight = img.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 2 - 20)
        imgHeight.priority = UILayoutPriority(rawValue: 999)
        
        NSLayoutConstraint.activate([
            img.topAnchor.constraint(equalTo: contentView.topAnchor),
            img.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            img.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imgWidth,
            imgHeight
        ])
    }
    
    private func setupTitle(title: String){
        self.title.text = title
        self.title.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        self.title.translatesAutoresizingMaskIntoConstraints = false
        self.title.textAlignment = .left
        contentView.addSubview(self.title)
        NSLayoutConstraint.activate([
            self.title.topAnchor.constraint(equalTo: img.bottomAnchor, constant: 10),
            self.title.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            self.title.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
    
    private func setupPrice(price: String){
        self.price.text = price
        self.price.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        self.price.translatesAutoresizingMaskIntoConstraints = false
        self.price.textAlignment = .left
        contentView.addSubview(self.price)
        NSLayoutConstraint.activate([
            self.price.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 5),
            self.price.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            self.price.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
    
    private func setupLocation(location: String){
        self.location.text = location
        self.location.font = UIFont.systemFont(ofSize: 12, weight: .light)
        self.location.translatesAutoresizingMaskIntoConstraints = false
        self.location.textAlignment = .left
        contentView.addSubview(self.location)
        NSLayoutConstraint.activate([
            self.location.topAnchor.constraint(equalTo: price.bottomAnchor, constant: 5),
            self.location.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            self.location.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
    
    private func setupDate(date: String){
        dateFormatter.dateFormat = "yyyy'-'MM'-'dd'"
        self.date.text = dateFormatter.date(from: date)?.toRusString
        self.date.font = UIFont.systemFont(ofSize: 12, weight: .light)
        self.date.translatesAutoresizingMaskIntoConstraints = false
        self.date.textAlignment = .left
        contentView.addSubview(self.date)
        NSLayoutConstraint.activate([
            self.date.topAnchor.constraint(equalTo: location.bottomAnchor, constant: 5),
            self.date.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            self.date.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            self.date.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}
