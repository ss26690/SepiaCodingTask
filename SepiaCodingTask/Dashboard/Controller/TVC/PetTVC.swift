//
//  PetTVC.swift
//  SepiaCodingTask
//
//  Created by Saurav Sagar on 27/02/23.
//

import UIKit

class PetTVC: UITableViewCell {

    @IBOutlet weak var petImage: UIImageView!
    @IBOutlet weak var petName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
