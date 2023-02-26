//
//  PetModel.swift
//  SepiaCodingTask
//
//  Created by Saurav Sagar on 26/02/23.
//

import UIKit

class PetModel: Codable {
    var image_url: String?
    var title: String?
    var content_url: String?
    var date_added: String?
    
    init(imageUrl: String, title: String, contentUrl: String,
         dateAdded: String) {
        self.image_url = imageUrl
        self.title = title
        self.content_url = contentUrl
        self.date_added = dateAdded
    }
}

class PetResult: Codable {
    var pets = [PetModel]()
    
    init(pets: [PetModel]) {
        self.pets = pets
    }
}
