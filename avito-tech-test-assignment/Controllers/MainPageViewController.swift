//
//  ViewController.swift
//  avito-tech-test-assignment
//
//  Created by Элина Карапетян on 25.08.2023.
//

import UIKit

class MainPageViewController: UIViewController {
    
    private let mainPageView: MainPageViewProtocol
    private let networkDataFetcher = NetworkDataFetcher()
    var advertisements: Advertisements? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        self.networkingRequest()
        self.mainPageView.didLoad()
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
    
    func networkingRequest(){
        let urlString = "https://www.avito.st/s/interns-ios/main-page.json"
        networkDataFetcher.fetchData(urlString: urlString) { (ads) in
            guard let ads = ads else {return}
            self.advertisements = ads
            self.mainPageView.reloadData()
        }
    }
    
}

extension MainPageViewController: MainPageViewControllerDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return advertisements?.advertisements.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "item", for: indexPath) as! ItemCollectionViewCell
        guard let item = advertisements?.advertisements[indexPath.item] else {return UICollectionViewCell()}
        cell.setup(item: item)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: view.frame.width / 2 - 5, height: 200)
    }
    
    
}