//
//  Service.swift
//  SepiaCodingTask
//
//  Created by Saurav Sagar on 26/02/23.
//

import UIKit

class Service {
    
    private init() {
        // For Creating singulton
    }
    
     static var sharedInstance = Service()
    
    func getAllPetData(completion: @escaping([PetModel]?) -> Void) {
        guard let data = FileLoader.readLocalFile("pets_list")
        else {
            fatalError("Unable to locate file \"pets_list.json\" in main bundle.")
        }
        
        do {
            var arrPetData = [PetModel]()
            let result = try JSONDecoder().decode(PetResult.self, from: data)
            result.pets.forEach {
                arrPetData.append(PetModel(imageUrl: $0.image_url ?? "",
                                           title: $0.title ?? "",
                                           contentUrl: $0.content_url ?? "", dateAdded: $0.date_added ?? ""))
            }
            
            completion(arrPetData)
        } catch let jsonErr {
            debugPrint("Json error: \(jsonErr.localizedDescription)")
        }
    }
}
