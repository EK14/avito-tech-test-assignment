//
//  Tools.swift
//  avito-tech-test-assignment
//
//  Created by Элина Карапетян on 30.08.2023.
//

import Foundation
import UIKit

class Tools{
    func setupUILabel(label: inout UILabel, title: String, fontSize: CGFloat, weight: UIFont.Weight, numberOfLines: Int = 0, textColor: UIColor = .black){
        label.text = title
        label.font = UIFont.systemFont(ofSize: fontSize, weight: weight)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.numberOfLines = numberOfLines
        label.textColor = textColor
    }
    
    func setupPrice(price: inout String){
        let rub = "₽" as Character
        if let i = price.firstIndex(of: rub) {
            price.remove(at: i)
        }
        if let i = price.firstIndex(of: " ") {
            price.remove(at: i)
        }
        price = "\(priceFormatter(price)) \(rub)"
    }
    
    func priceFormatter(_ price: String) -> String{
        let numberFormatter = NumberFormatter()
        numberFormatter.groupingSeparator = " "
        numberFormatter.groupingSize = 3
        numberFormatter.usesGroupingSeparator = true
        numberFormatter.decimalSeparator = "."
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = 2
        if let myPrice = Int(price) {
            let myNumber = NSNumber(value:myPrice)
            return numberFormatter.string(from: myNumber)!
        }
        else{
            print("error")
            return String()
        }
        }
}
