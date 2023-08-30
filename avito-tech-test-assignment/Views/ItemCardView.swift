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
    
    private let tools = Tools()
    weak var delegate: ItemCardViewControllerDelegate?
    private var card: Card? = nil
    private let img = UIImageView()
    private var price = UILabel()
    private var title = UILabel()
    private var location = UILabel()
    private var address = UILabel()
    private var descr = UILabel()
    private var descTitle = UILabel()
    private var adNumber = UILabel()
    private let dateFormatter = DateFormatter()
    private var date = UILabel()
    
    private func setupImage(){
        guard let url = card?.image_url else {return}
        img.sd_setImage(with: URL(string: url))
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
        tools.setupUILabel(label: &self.price, title: price, fontSize: 36, weight: .bold)
        addSubview(self.price)
        NSLayoutConstraint.activate([
            self.price.topAnchor.constraint(equalTo: img.bottomAnchor, constant: 10),
            self.price.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            self.price.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    private func setupTitle(){
        guard let title = card?.title else {return}
        tools.setupUILabel(label: &self.title, title: title, fontSize: 16, weight: .bold)
        addSubview(self.title)
        NSLayoutConstraint.activate([
            self.title.topAnchor.constraint(equalTo: price.bottomAnchor, constant: 5),
            self.title.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            self.title.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    private func setupAddress(){
        guard let location = card?.location else {return}
        guard let address = card?.address else {return}
        tools.setupUILabel(label: &self.location, title: location, fontSize: 16, weight: .regular)
        tools.setupUILabel(label: &self.address, title: address, fontSize: 16, weight: .regular)
        addSubview(self.location)
        addSubview(self.address)
        NSLayoutConstraint.activate([
            self.location.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 5),
            self.location.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            self.location.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            self.address.topAnchor.constraint(equalTo: self.location.bottomAnchor),
            self.address.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            self.address.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }
    
    private func setupDescription(){
        tools.setupUILabel(label: &descTitle, title: "Описание", fontSize: 30, weight: .bold)
        
        guard let description = card?.description else {return}
        tools.setupUILabel(label: &self.descr, title: description, fontSize: 16, weight: .regular,
        numberOfLines: 0)
        addSubview(descTitle)
        addSubview(self.descr)
        NSLayoutConstraint.activate([
            descTitle.topAnchor.constraint(equalTo: address.bottomAnchor, constant: 20),
            descTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            descTitle.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            self.descr.topAnchor.constraint(equalTo: descTitle.bottomAnchor, constant: 10),
            self.descr.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            self.descr.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
        ])
    }
    
    private func setupDateAndID(){
        guard let id = card?.id else {return}
        guard let createdDate = card?.created_date else {return}
        dateFormatter.dateFormat = "yyyy'-'MM'-'dd'"
        guard let date = dateFormatter.date(from: createdDate)?.toRusString else {return}
        tools.setupUILabel(label: &adNumber, title: "Объявление №\(id)", fontSize: 12, weight: .regular, textColor: .gray)
        tools.setupUILabel(label: &self.date, title: date, fontSize: 12, weight: .regular, textColor: .gray)
        addSubview(self.date)
        addSubview(adNumber)
        NSLayoutConstraint.activate([
            adNumber.topAnchor.constraint(equalTo: descr.bottomAnchor, constant: 20),
            adNumber.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            adNumber.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            self.date.topAnchor.constraint(equalTo: adNumber.bottomAnchor),
            self.date.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            self.date.trailingAnchor.constraint(equalTo: trailingAnchor),
        
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
            setupTitle()
            setupAddress()
            setupDescription()
            setupDateAndID()
        } else{
            print("item didnt load")
        }
    }
}
