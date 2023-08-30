//
//  ItemCardViewController.swift
//  avito-tech-test-assignment
//
//  Created by Элина Карапетян on 28.08.2023.
//

import UIKit

class ItemCardViewController: UIViewController {
    
    private let scrollView = UIScrollView()
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
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func networkingRequest(){
        let urlString = "https://www.avito.st/s/interns-ios/details/\(ID).json"
        networkDataFetcher.fetchData(urlString: urlString) { (card: Card?) in
            guard let card = card else {return}
            self.card = card
            self.itemCardView.setupItemCardView(card: self.card)
        }
    }
    
    private func setupView(){
        view.backgroundColor = .white
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.alwaysBounceVertical = true
        view.addSubview(scrollView)
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        
        itemCardView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(itemCardView)
        NSLayoutConstraint.activate([
            itemCardView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            itemCardView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            itemCardView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            itemCardView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            itemCardView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
    }
}

extension ItemCardViewController: ItemCardViewControllerDelegate{
    func setup(){
        networkingRequest()
    }
}
