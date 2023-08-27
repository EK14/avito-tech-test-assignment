//
//  Service.swift
//  avito-tech-test-assignment
//
//  Created by Элина Карапетян on 27.08.2023.
//

import Foundation

class Service{
    
    func request(urlString: String, completion: @escaping (Result<Advertisements, Error>) -> Void){
        guard let url = URL(string: urlString) else {return}
        URLSession.shared.dataTask(with: url) { data, response, error in
            DispatchQueue.main.async {
                if let error = error {
                    print("Some error")
                    completion(.failure(error))
                }
                guard let data = data else {return}
                do{
                    let items = try JSONDecoder().decode(Advertisements.self, from: data)
                    completion(.success(items))
                }
                catch let jsonError {
                    print("Failed to decode JSON", jsonError)
                    completion(.failure(jsonError))
                }
            }
        }.resume()
    }
}
