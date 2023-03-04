//
//  Service.swift
//  SepiaCodingTask
//
//  Created by Saurav Sagar on 26/02/23.
//

import UIKit

struct Service {
    
    // Instance of structure
    static var sharedInstance = Service()
    
    // Getting Data form Json File returning in completion handler after data get from Json
    func getAllPetData(_ localFile: Data, completion: @escaping([PetModel]?) -> Void) {
        do {
            var arrPetData = [PetModel]()
            let result = try JSONDecoder().decode(PetResult.self, from: localFile)
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
