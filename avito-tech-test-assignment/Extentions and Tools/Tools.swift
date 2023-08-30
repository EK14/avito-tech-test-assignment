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
}
