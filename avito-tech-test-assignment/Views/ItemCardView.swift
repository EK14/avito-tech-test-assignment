//
//  ItemCardView.swift
//  avito-tech-test-assignment
//
//  Created by Элина Карапетян on 28.08.2023.
//

import UIKit

protocol ItemCardViewProtocol: UIView{
    func setupItemCardView(card: Card?)
}

class ItemCardView: UIView {
    
    weak var delegate: ItemCardViewControllerDelegate?
    private var card: Card? = nil
    private let img = UIImageView()
    private let price = UILabel()
    
    private func setupImage(){
        guard let url = card?.image_url else {return}
        img.sd_setImage(with: URL(string: url))
        img.layer.cornerRadius = 5
        img.clipsToBounds = true
        img.translatesAutoresizingMaskIntoConstraints = false
        addSubview(img)
        NSLayoutConstraint.activate([
            img.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            img.heightAnchor.constraint(equalToConstant: frame.height / 2),
            img.leadingAnchor.constraint(equalTo: leadingAnchor),
            img.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    private func setupPrice(){
        guard let price = card?.price else {return}
        self.price.text = price
        self.price.font = UIFont.systemFont(ofSize: 36, weight: .bold)
        self.price.translatesAutoresizingMaskIntoConstraints = false
        self.price.textAlignment = .left
        addSubview(self.price)
        NSLayoutConstraint.activate([
            self.price.topAnchor.constraint(equalTo: img.bottomAnchor, constant: 10),
            self.price.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            self.price.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }

}

extension ItemCardView: ItemCardViewProtocol{
    func setupItemCardView(card: Card?){
        self.backgroundColor = .white
        if let card = card {
            self.card = card
            setupImage()
            setupPrice()
        } else{
            print("item didnt load")
        }
    }
}
