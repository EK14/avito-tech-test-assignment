//
//  Item.swift
//  avito-tech-test-assignment
//
//  Created by Элина Карапетян on 27.08.2023.
//

import Foundation

struct Item: Decodable{
    var id: Int
    var title: String
    var price: String
    var location: String
    var image_url: String
    var created_date: String
}
