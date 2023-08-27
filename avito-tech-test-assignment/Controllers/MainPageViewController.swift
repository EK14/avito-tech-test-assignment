//
//  ViewController.swift
//  avito-tech-test-assignment
//
//  Created by Элина Карапетян on 25.08.2023.
//

import UIKit

class MainPageViewController: UIViewController {
    
    private let mainPageView: MainPageViewProtocol
    private let service = Service()
    var advertisements: Advertisements? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        mainPageView.didLoad()
        networkingRequest()
    }
    
    init(mainPageView: MainPageViewProtocol){
        self.mainPageView = mainPageView
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = mainPageView
    }
    
    private func networkingRequest(){
        let urlString = "https://www.avito.st/s/interns-ios/main-page.json"
        service.request(urlString: urlString) { [weak self] (result) in
            switch result{
            case .success(let ads):
                self?.advertisements = ads
                self?.mainPageView.reloadData()
            case .failure(let error):
                print(error)
            }
        }
    }
    
}

extension MainPageViewController: MainPageViewControllerDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        advertisements?.advertisements.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "item", for: indexPath) as! ItemCollectionViewCell
        guard let item = advertisements?.advertisements[indexPath.item] else {return UICollectionViewCell()}
        cell.setup(item: item)
        return cell
    }
    
    
}
