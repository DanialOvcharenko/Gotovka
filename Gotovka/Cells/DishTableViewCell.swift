//
//  DishTableViewCell.swift
//  Gotovka
//
//  Created by Mac on 04.08.2022.
//

import UIKit

class DishTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var levelLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    
    
    var dish: DishModel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

}
