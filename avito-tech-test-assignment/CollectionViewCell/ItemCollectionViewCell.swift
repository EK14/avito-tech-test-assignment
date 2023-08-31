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
    private var title = UILabel()
    private var price = UILabel()
    private var location = UILabel()
    private var date = UILabel()
    private let dateFormatter = DateFormatter()
    private let tools = Tools()
    var delegate: MainPageViewControllerDelegate!
    
    override var isSelected: Bool{
            didSet{
                UIView.animate(withDuration: 0.1, delay: 0.0, options: .curveEaseOut, animations: {
                    self.transform = self.isSelected ? CGAffineTransform(scaleX: 0.95, y: 0.95) : CGAffineTransform.identity
                }, completion: nil)
                UIView.animate(withDuration: 0.5, delay: 0.0, options: .curveEaseOut, animations: {
                    self.transform = self.isSelected ? CGAffineTransform(scaleX: 1, y: 1) : CGAffineTransform.identity
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
        tools.setupUILabel(label: &self.title, title: title, fontSize: 16, weight: .regular, numberOfLines: 1)
        contentView.addSubview(self.title)
        NSLayoutConstraint.activate([
            self.title.topAnchor.constraint(equalTo: img.bottomAnchor, constant: 10),
            self.title.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            self.title.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
    
    private func setupPrice(price: String?){
        guard var priceText = price else {return}
        tools.setupPrice(price: &priceText)
        tools.setupUILabel(label: &self.price, title: priceText, fontSize: 16, weight: .bold)
        contentView.addSubview(self.price)
        NSLayoutConstraint.activate([
            self.price.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 5),
            self.price.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            self.price.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
    
    private func setupLocation(location: String){
        tools.setupUILabel(label: &self.location, title: location, fontSize: 12, weight: .regular, textColor: .gray)
        contentView.addSubview(self.location)
        NSLayoutConstraint.activate([
            self.location.topAnchor.constraint(equalTo: price.bottomAnchor, constant: 5),
            self.location.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            self.location.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
    
    private func setupDate(date: String){
        dateFormatter.dateFormat = "yyyy'-'MM'-'dd'"
        guard let title = dateFormatter.date(from: date)?.toRusString else {return}
        tools.setupUILabel(label: &self.date, title: title, fontSize: 12, weight: .regular, textColor: .gray)
        contentView.addSubview(self.date)
        NSLayoutConstraint.activate([
            self.date.topAnchor.constraint(equalTo: location.bottomAnchor, constant: 5),
            self.date.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            self.date.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            self.date.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}
