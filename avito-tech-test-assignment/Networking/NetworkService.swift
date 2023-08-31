//
//  Service.swift
//  avito-tech-test-assignment
//
//  Created by Элина Карапетян on 27.08.2023.
//

import Foundation

class NetworkService{
    
    func request(urlString: String, completion: @escaping (Result<Data, Error>) -> Void){
        guard let url = URL(string: urlString) else {return}
        URLSession.shared.dataTask(with: url) { data, response, error in
            DispatchQueue.main.async {
                if let error = error {
                    completion(.failure(error))
                }
                guard let data = data else {return}
                completion(.success(data))
            }
        }.resume()
    }
}
