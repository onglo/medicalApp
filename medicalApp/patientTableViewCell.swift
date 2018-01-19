//
//  patientTableViewCell.swift
//  medicalApp
//
//  Created by Edouard Long on 19/01/2018.
//  Copyright © 2018 Edouard Long. All rights reserved.
//

import UIKit

class patientTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UIView!
    @IBOutlet weak var datesLabel: UILabel!
    @IBOutlet weak var priorityLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
