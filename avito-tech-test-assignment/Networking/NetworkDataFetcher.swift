//
//  NetworkDataFetcher.swift
//  avito-tech-test-assignment
//
//  Created by Элина Карапетян on 27.08.2023.
//

import Foundation

class NetworkDataFetcher{
    let networkService = NetworkService()
    
    func fetchData(urlString: String, response: @escaping (Advertisements?) -> Void){
        networkService.request(urlString: urlString) { (result) in
            switch result{
            case .success(let data):
                do{
                    let items = try JSONDecoder().decode(Advertisements.self, from: data)
                    response(items)
                }
                catch let jsonError {
                    print("Failed to decode JSON", jsonError)
                    response(nil)
                }
            case .failure(let error):
                response(nil)
            }
        }
    }
}
