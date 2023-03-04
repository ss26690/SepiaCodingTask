//
//  PetTVC.swift
//  SepiaCodingTask
//
//  Created by Saurav Sagar on 27/02/23.
//

import UIKit
import Kingfisher

class PetTVC: UITableViewCell {

    @IBOutlet weak private var petImage: UIImageView!
    @IBOutlet weak private var petName: UILabel!
    
    // Set Cell Data
    var cellData: PetViewModel? {
        didSet {
            if let imageUrl = cellData?.imageUrl, !imageUrl.isEmpty {
                let source = ImageResource(downloadURL: URL(string: imageUrl)!,
                                           cacheKey: cellData?.imageUrl )
                petImage.kf.setImage(with: source)
            }
            petName.text = cellData?.title
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
