//
//  IngridientsTableViewCell.swift
//  Gotovka
//
//  Created by Mac on 12.08.2022.
//

import UIKit

class IngridientsTableViewCell: UITableViewCell {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var button: UIButton!
    
    var state = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        button.layer.borderWidth = 2
        button.layer.cornerRadius = button.bounds.height / 2
        button.layer.borderColor = UIColor.white.cgColor
        
    }

    @IBAction func buttonPressed(_ sender: Any) {

    }
}
