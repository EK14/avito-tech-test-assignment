//
//  ItemCardViewController.swift
//  avito-tech-test-assignment
//
//  Created by Элина Карапетян on 28.08.2023.
//

import UIKit

class ItemCardViewController: UIViewController {
    
    private let scrollView = UIScrollView()
    private let animation = AnimationViewController()
    private let itemCardView: ItemCardViewProtocol
    private let networkDataFetcher = NetworkDataFetcher()
    private let errorAlert = UIAlertController(title: "Error", message: "", preferredStyle: .alert)
    private var okBtn = UIAlertAction(title: "OK", style: .default)
    private var card: Card? = nil
    var ID = String()

    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.isHidden = true
        self.view.insertSubview(animation.view, at: 1)
        animation.view.frame.origin = CGPoint(x: 0, y: 0)
        addChild(animation)
    }
    
    init(itemCardView: ItemCardViewProtocol){
        self.itemCardView = itemCardView
        super.init(nibName: nil, bundle: nil)
        networkDataFetcher.itemCardDelegate = self
        setupView()
        setupAlert()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupAlert(){
        okBtn = UIAlertAction(title: "OK", style: .default, handler: { _ in
            self.navigationController?.popViewController(animated: true)
        })
        errorAlert.addAction(okBtn)
    }

    private func networkingRequest(){
        let urlString = "https://www.avito.st/s/interns-ios/details/\(ID).json"
        networkDataFetcher.fetchData(urlString: urlString) { (card: Card?, error: String?) in
            guard let card = card
            else {
                self.requestErrorAlert(error: error ?? "error description unfound")
                return
            }
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
        scrollView.isHidden = false
        networkingRequest()
    }
    
    func requestErrorAlert(error: String){
        errorAlert.title = error
        self.present(errorAlert, animated: true)
    }
}
