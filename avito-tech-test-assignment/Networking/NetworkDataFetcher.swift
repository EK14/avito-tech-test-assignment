//
//  NetworkDataFetcher.swift
//  avito-tech-test-assignment
//
//  Created by Элина Карапетян on 27.08.2023.
//

import Foundation

class NetworkDataFetcher{
    let networkService = NetworkService()
    
    func fetchData<T: Decodable>(urlString: String, response: @escaping (T?) -> Void){
        networkService.request(urlString: urlString) { (result) in
            switch result{
            case .success(let data):
                do{
                    let items = try JSONDecoder().decode(T.self, from: data)
                    response(items)
                }
                catch let jsonError {
                    print("Failed to decode JSON", jsonError)
                    response(nil)
                }
            case .failure(_):
                response(nil)
            }
        }
    }
}
