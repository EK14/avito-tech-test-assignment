//
//  Service.swift
//  avito-tech-test-assignment
//
//  Created by Элина Карапетян on 27.08.2023.
//

import Foundation

class Service{
    
    func request(urlString: String, completion: (Data?, Error?) -> Void){
        var urlComponent = URLComponents()
        urlComponent.scheme = "https"
        urlComponent.host = "www.avito.st"
        urlComponent.path = "/s/interns-ios/main-page.json"
        
        URLSession.shared.dataTask(with: urlComponent.url!) { data, response, error in
            DispatchQueue.main.async {
                if let error = error {print("Some error")}
                guard let data = data else {return}
                let someString = String(data: data, encoding: .utf8)
                print(someString ?? "no data")
            }
        }.resume()
    }
}
