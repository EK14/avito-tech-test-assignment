//
//  NetworkDataFetcher.swift
//  avito-tech-test-assignment
//
//  Created by Элина Карапетян on 27.08.2023.
//

import Foundation

class NetworkDataFetcher{
    let networkService = NetworkService()
    var mainPageDelegate: MainPageViewControllerDelegate? = nil
    var itemCardDelegate: ItemCardViewControllerDelegate? = nil
    
    func fetchData<T: Decodable>(urlString: String, response: @escaping (T?, String?) -> Void){
        networkService.request(urlString: urlString) { (result) in
            switch result{
            case .success(let data):
                do{
                    let items = try JSONDecoder().decode(T.self, from: data)
                    response(items, nil)
                }
                catch let jsonError {
                    response(nil, jsonError.localizedDescription)
                }
            case .failure(let error):
                response(nil, error.localizedDescription)
            }
        }
    }
}
