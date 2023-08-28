//
//  ItemCardViewController.swift
//  avito-tech-test-assignment
//
//  Created by Элина Карапетян on 28.08.2023.
//

import UIKit

class ItemCardViewController: UIViewController {
    
    private let itemCardView: ItemCardViewProtocol
    var ID = String()

    override func viewDidLoad() {
        super.viewDidLoad()
        itemCardView.setupItemCardView()
    }
    
    init(itemCardView: ItemCardViewProtocol){
        self.itemCardView = itemCardView
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = itemCardView
    }
    
}

extension ItemCardViewController: ItemCardViewControllerDelegate{
    
}
