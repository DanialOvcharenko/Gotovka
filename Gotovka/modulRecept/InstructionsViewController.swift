//
//  InstructionsViewController.swift
//  Gotovka
//
//  Created by Mac on 05.08.2022.
//

import UIKit

class InstructionsViewController: UIViewController {
    
    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var secondView: UIView!
    @IBOutlet weak var thirdView: UIView!
    @IBOutlet weak var forthView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        firstView.layer.cornerRadius = firstView.bounds.height / 10
        secondView.layer.cornerRadius = secondView.bounds.height / 10
        thirdView.layer.cornerRadius = thirdView.bounds.height / 10
        forthView.layer.cornerRadius = forthView.bounds.height / 10
        
        firstView.layer.borderWidth = 2
        firstView.layer.borderColor = UIColor.gray.cgColor
        secondView.layer.borderWidth = 2
        secondView.layer.borderColor = UIColor.gray.cgColor
        thirdView.layer.borderWidth = 2
        thirdView.layer.borderColor = UIColor.gray.cgColor
        forthView.layer.borderWidth = 2
        forthView.layer.borderColor = UIColor.gray.cgColor
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    
    @IBAction func firstViewTapped(_ sender: UITapGestureRecognizer) {
        let storyboard = UIStoryboard(name: "Sheet", bundle: nil)
        let sheetPresentationController = storyboard.instantiateViewController(withIdentifier: "BottomSheetFirst") as! BottomSheetFirst
        self.present(sheetPresentationController, animated: true, completion: nil)
    }
    
    @IBAction func secondViewTapped(_ sender: UITapGestureRecognizer) {
        let storyboard = UIStoryboard(name: "Sheet", bundle: nil)
        let sheetPresentationController = storyboard.instantiateViewController(withIdentifier: "BottomSheetSecond") as! BottomSheetSecond
        self.present(sheetPresentationController, animated: true, completion: nil)
    }
    
    @IBAction func thirdViewTapped(_ sender: UITapGestureRecognizer) {
        let storyboard = UIStoryboard(name: "Sheet", bundle: nil)
        let sheetPresentationController = storyboard.instantiateViewController(withIdentifier: "BottomSheetThird") as! BottomSheetThird
        self.present(sheetPresentationController, animated: true, completion: nil)
    }
    
    @IBAction func fourthViewTapped(_ sender: UITapGestureRecognizer) {
        let storyboard = UIStoryboard(name: "Sheet", bundle: nil)
        let sheetPresentationController = storyboard.instantiateViewController(withIdentifier: "BottomSheetFourth") as! BottomSheetFourth
        self.present(sheetPresentationController, animated: true, completion: nil)
    }
    
}


