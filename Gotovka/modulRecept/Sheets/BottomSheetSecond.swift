//
//  BottomSheetSecond.swift
//  Gotovka
//
//  Created by Mac on 09.08.2022.
//

import UIKit

class BottomSheetSecond: UIViewController, UISheetPresentationControllerDelegate {

    @IBOutlet weak var image: UIImageView!
    
    override var sheetPresentationController: UISheetPresentationController {
        presentationController as! UISheetPresentationController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        image.layer.cornerRadius = image.bounds.width / 20
        image.layer.borderWidth = 2
        image.layer.borderColor = UIColor.gray.cgColor
        
        sheetPresentationController.delegate = self
        sheetPresentationController.selectedDetentIdentifier = .large
        sheetPresentationController.largestUndimmedDetentIdentifier = .medium
        sheetPresentationController.prefersGrabberVisible = true
        sheetPresentationController.preferredCornerRadius = view.bounds.width / 10
        sheetPresentationController.detents = [.medium(), .large()]
        
    }
}
