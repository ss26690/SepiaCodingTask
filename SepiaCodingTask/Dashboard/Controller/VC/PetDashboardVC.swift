//
//  PetDashboardVC.swift
//  SepiaCodingTask
//
//  Created by Saurav Sagar on 27/02/23.
//

import UIKit
import Kingfisher
import SafariServices

class PetDashboardVC: UIViewController {
    
    @IBOutlet weak var petListingTV: UITableView!
    var arrPetVM = [PetViewModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        getData()
    }
    
    // Fetching requesred data to process accoring to requirementService obj = Service()
    func getData() {
        
        guard let data = FileLoader.readLocalFile("pets_list") else {
            fatalError("Unable to locate file \"pets_list.json\" in main bundle.")
        }
        
        Service.sharedInstance.getAllPetData(data) {pet in
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
    
    // MARK: Open in-app Webpage
    func showTutorial(_ index: Int) {
        if let url = URL(string: arrPetVM[index].contentUrl ?? "") {
            let config = SFSafariViewController.Configuration()
            config.entersReaderIfAvailable = true

            let webVc = SFSafariViewController(url: url, configuration: config)
            present(webVc, animated: true)
        }
    }

}

// MARK: Tableview Delegates and Data Source
extension PetDashboardVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        arrPetVM.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PetTVC", for: indexPath) as? PetTVC else {
            return UITableViewCell()
        }
        
        cell.cellData = arrPetVM[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        showTutorial(indexPath.row)
    }
}
