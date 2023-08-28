//
//  ItemCardView.swift
//  avito-tech-test-assignment
//
//  Created by Элина Карапетян on 28.08.2023.
//

import UIKit

protocol ItemCardViewProtocol: UIView{
    
}

class ItemCardView: UIView {
    
    weak var delegate: ItemCardViewControllerDelegate?


}

extension ItemCardView: ItemCardViewProtocol{
    
}
