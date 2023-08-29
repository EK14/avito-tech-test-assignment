//
//  ItemCardViewController.swift
//  avito-tech-test-assignment
//
//  Created by Элина Карапетян on 28.08.2023.
//

import UIKit

class ItemCardViewController: UIViewController {
    
    private let itemCardView: ItemCardViewProtocol
    private let networkDataFetcher = NetworkDataFetcher()
    private var card: Card? = nil
    var ID = String()

    override func viewDidLoad() {
        super.viewDidLoad()
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
    
    private func networkingRequest(){
        let urlString = "https://www.avito.st/s/interns-ios/details/\(ID).json"
        networkDataFetcher.fetchData(urlString: urlString) { (card: Card?) in
            guard let card = card else {return}
            self.card = card
            self.itemCardView.setupItemCardView(card: self.card)
        }
    }
}

extension ItemCardViewController: ItemCardViewControllerDelegate{
    func setup(){
        networkingRequest()
    }
}
