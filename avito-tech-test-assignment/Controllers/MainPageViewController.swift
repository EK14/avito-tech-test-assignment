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
    private var advertisements: Advertisements? = nil
    private let itemCardViewController = ItemCardViewControllerAssembly().create()
    private let errorAlert = UIAlertController(title: "Error", message: "", preferredStyle: .alert)
    private let okBtn = UIAlertAction(title: "OK", style: .default)

    override func viewDidLoad() {
        super.viewDidLoad()
        self.networkingRequest()
        self.mainPageView.didLoad()
    }
    
    init(mainPageView: MainPageViewProtocol){
        self.mainPageView = mainPageView
        super.init(nibName: nil, bundle: nil)
        networkDataFetcher.mainPageDelegate = self
        errorAlert.addAction(okBtn)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = mainPageView
    }
    
    func networkingRequest(){
        let urlString = "https://www.avito.st/s/interns-ios/main-page.json"
        networkDataFetcher.fetchData(urlString: urlString) { (ads: Advertisements?, error: String?) in
            guard let ads = ads
            else {
                self.requestErrorAlert(error: error ?? "error description unfound")
                return
            }
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
        cell.delegate = self
        cell.setup(item: item)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: UIScreen.main.bounds.width / 2 - 20, height: (UIScreen.main.bounds.width / 2 - 20) * 1.7)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let item = advertisements?.advertisements[indexPath.item]{
            itemCardViewController.ID = item.id
            itemCardViewController.setup()
            self.navigationController?.pushViewController(self.itemCardViewController, animated: true)
        } else {
            print("error")
        }
    }
    
    func requestErrorAlert(error: String){
        errorAlert.title = error
        self.present(errorAlert, animated: true)
    }
}
