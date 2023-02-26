//
//  PetViewModel.swift
//  SepiaCodingTask
//
//  Created by Saurav Sagar on 26/02/23.
//

import UIKit

class PetViewModel {
    
    var imageUrl: String?
    var title: String?
    var contentUrl: String?
    var dateAdded: String?
    
    init(pet: PetModel) {
        self.dateAdded = pet.date_added
        self.title = pet.title
        self.contentUrl = pet.content_url
        self.imageUrl = pet.image_url
    }
}
