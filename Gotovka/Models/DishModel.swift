//
//  DishModel.swift
//  Gotovka
//
//  Created by Mac on 03.08.2022.
//

import Foundation
import UIKit

enum TypeOfDish{
    case easy
    case normal
    case hard
}

class DishModel: NSObject {
    var name: String
    var countryOfOrigin: String
    var image: UIImage
    var TypeOfDish: TypeOfDish
    var descript: String
    var recept: String
    var ingridients: [String]?
    var time: Int
    
    init(name:String,countryOfOrigin:String,image:UIImage,TypeOfDish:TypeOfDish,descript:String, recept:String,ingridients:[String],time:Int) {
        self.name = name
        self.countryOfOrigin = countryOfOrigin
        self.image = image
        self.TypeOfDish = TypeOfDish
        self.descript = descript
        self.recept = recept
        self.ingridients = ingridients
        self.time = time
    }
}
