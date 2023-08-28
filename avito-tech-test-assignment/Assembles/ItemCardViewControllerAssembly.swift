//
//  ItemCardViewControllerAssembly.swift
//  avito-tech-test-assignment
//
//  Created by Элина Карапетян on 28.08.2023.
//

import Foundation

struct ItemCardViewControllerAssembly{
    func create() -> ItemCardViewController{
        let itemCardView = ItemCardView()
        
        let controller = ItemCardViewController(itemCardView: itemCardView)
        
        itemCardView.delegate = controller
        
        return controller
    }
}
