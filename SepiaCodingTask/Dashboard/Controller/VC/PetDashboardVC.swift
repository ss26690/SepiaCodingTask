//
//  PetDashboardVC.swift
//  SepiaCodingTask
//
//  Created by Saurav Sagar on 27/02/23.
//

import UIKit
import Kingfisher

class PetDashboardVC: UIViewController {
    
    @IBOutlet weak var petListingTV: UITableView!
    var arrPetVM = [PetViewModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        getData()
    }
    

    func getData() {
        Service.sharedInstance.getAllPetData {pet in
            if pet != nil {
                self.arrPetVM = pet?.map({
                    return PetViewModel(pet: $0)
                }) ?? []
                
                DispatchQueue.main.async {
                    self.petListingTV.reloadData()
                }
            }
        }
    }

}

extension PetDashboardVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        arrPetVM.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PetTVC", for: indexPath) as? PetTVC else {
            return UITableViewCell()
        }
        let cellData = arrPetVM[indexPath.row]
        if let imageUrl = cellData.imageUrl, !imageUrl.isEmpty {
            let source = ImageResource(downloadURL: URL(string: imageUrl)!,
                                       cacheKey: cellData.imageUrl )
            cell.petImage.kf.setImage(with: source)
        }
        cell.petName.text = cellData.title
        
        return cell
    }
    
    
}
