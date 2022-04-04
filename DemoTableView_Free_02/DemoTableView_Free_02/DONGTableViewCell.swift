//
//  DONGTableViewCell.swift
//  DemoTableView_Free_02
//
//  Created by Nguyen Duc Chau on 01/04/2022.
//

import UIKit

class DONGTableViewCell: UITableViewCell {

    @IBOutlet weak var imgHinh: UIImageView!
    @IBOutlet weak var myLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
