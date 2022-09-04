//
//  DishDeteilVC.swift
//  Gotovka
//
//  Created by Mac on 04.08.2022.
//

import UIKit
import UserNotifications
import AVFoundation

class DishDeteilVC: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var country: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var receptLabel: UILabel!
    @IBOutlet weak var ingridientsLabel: UILabel!
    @IBOutlet weak var toListButton: UIButton!
    @IBOutlet weak var timerView: UIView!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var adviceLabel: UILabel!
    
    let ingriListKey = "ingriListKey"
    var ingriList = [""]
    
    var timer = Timer()
    var isStarted = false
    var counter: Int = 0
    var time : Int = 0
    var resetTime : Int = 0
    
    let systemSoundEnd: SystemSoundID = 1335
    let systemSoundAttention: SystemSoundID = 1331
    
    var dish: DishModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        time = dish.time
        resetTime = dish.time
        timerLabel.text = NSString(format: "%0.2d:%0.2d", time / 60, time % 60) as String

        nameLabel.text = dish.name
        imageView.image = dish.image
        country.text = "Origin: " + dish.countryOfOrigin
        descriptionLabel.text = "Description: " + dish.descript
        receptLabel.text = "Recept of the " + dish.name + ": " + dish.recept
        
        guard let ingrid = dish.ingridients else { return }
        let ingridientsString = ingrid.joined()
        ingridientsLabel.text = "Ingridients: " + ingridientsString
        
        switch nameLabel.text {
        case "test":
            adviceLabel.text = "Follow the instructions and good Luck!"
        case "Pasta":
            adviceLabel.text = "Salt the boiling water and put the pasta \n Follow the instructions and good Luck!"
        default:
            adviceLabel.text = "Follow the instructions and good Luck!"
        }
        
        toListButton.layer.cornerRadius = toListButton.bounds.height / 2
        
        imageView.layer.cornerRadius = imageView.bounds.height / 3
        imageView.layer.borderWidth = 5.0
        
        timerView.layer.cornerRadius = timerView.bounds.height / 7
        timerView.layer.borderWidth = 1
        timerView.layer.borderColor = UIColor.systemGray.cgColor
        
        startButton.layer.cornerRadius = startButton.bounds.height / 10
        stopButton.layer.cornerRadius = startButton.bounds.height / 10
        resetButton.layer.cornerRadius = startButton.bounds.height / 10
        
        if dish.TypeOfDish == .easy {
            imageView.layer.borderColor = UIColor.systemTeal.cgColor
            country.textColor = UIColor.systemTeal
        } else if dish.TypeOfDish == .normal {
            imageView.layer.borderColor = UIColor.systemBlue.cgColor
            country.textColor = UIColor.systemBlue
        } else {
            imageView.layer.borderColor = UIColor.purple.cgColor
            country.textColor = UIColor.purple
        }
    }
    
    
    @objc func timerAction() {
        if counter > 0 {
            counter -= 1
            timerLabel.text = NSString(format: "%0.2d:%0.2d", counter / 60, counter % 60) as String
        }
        
        // Checking the advice label
        checking()
        
        if counter <= 0 {
            isStarted = false
            timer.invalidate()
            time = counter
            self.startButton.setTitle("Start", for: .normal)
            self.startButton.setTitleColor(self.timerView.backgroundColor, for: .normal)
            self.startButton.backgroundColor = UIColor.white
            self.stopButton.setTitle("Stop", for: .normal)
            self.stopButton.setTitleColor(self.timerView.backgroundColor, for: .normal)
            self.stopButton.backgroundColor = UIColor.white
        }
    }
    
    @IBAction func timerStartButtonPressed(_ sender: Any) {
        if isStarted != true {
            isStarted = true
            counter = time
            if counter == 0 {
                counter = resetTime
                self.adviceLabel.text = "Follow the instructions and good Luck!"
                let alert = UIAlertController(title: "Attention" , message: "You restarted the timer", preferredStyle: .alert)
                let cancelAction = UIAlertAction(title: "Cancel", style: .default) { (alert) in
                    self.isStarted = false
                    self.counter = 0
                    self.time = 0
                    self.timer.invalidate()
                    self.timerLabel.text = "00:00"
                    
                    self.adviceLabel.text = "Bon appetit!"
                    AudioServicesPlaySystemSound(self.systemSoundEnd)
                    
                    self.startButton.setTitle("Start", for: .normal)
                    self.startButton.setTitleColor(self.timerView.backgroundColor, for: .normal)
                    self.startButton.backgroundColor = UIColor.white
                    self.stopButton.setTitle("Stop", for: .normal)
                    self.stopButton.setTitleColor(self.timerView.backgroundColor, for: .normal)
                    self.stopButton.backgroundColor = UIColor.white
                }
                
                alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
                alert.addAction(cancelAction)
                
                self.present(alert, animated: true, completion: nil)
                let when = DispatchTime.now() + 10
                DispatchQueue.main.asyncAfter(deadline: when) {
                    alert.dismiss(animated: true, completion: nil)
                }
            }
            
            timer.invalidate()
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(DishDeteilVC.timerAction), userInfo: nil, repeats: true)
            
            startButton.setTitle("Start", for: .normal)
            startButton.setTitleColor(UIColor.white, for: .normal)
            startButton.backgroundColor = timerView.backgroundColor
            stopButton.setTitle("Stop", for: .normal)
            stopButton.setTitleColor(timerView.backgroundColor, for: .normal)
            stopButton.backgroundColor = UIColor.white
        }
    }
    
    @IBAction func timerStopButtonPressed(_ sender: Any) {
        isStarted = false
        timer.invalidate()
        if counter == 0 {
            counter = resetTime
            startButton.setTitle("Start", for: .normal)
        } else {
            time = counter
            startButton.setTitle("Continue", for: .normal)
        }
        
        startButton.setTitleColor(timerView.backgroundColor, for: .normal)
        startButton.backgroundColor = UIColor.white
        stopButton.setTitle("Stop", for: .normal)
        stopButton.setTitleColor(UIColor.white, for: .normal)
        stopButton.backgroundColor = timerView.backgroundColor
    }
    
    @IBAction func timerRefreshButtonPressed(_ sender: Any) {
        
        let alert = UIAlertController(title: "Are you shure?" , message: "Do you really want to refresh timer?", preferredStyle: .alert)
        let yesAction = UIAlertAction(title: "Yes, i want", style: .default) { (alert) in
            self.isStarted = false
            self.counter = self.resetTime
            self.time = self.resetTime
            self.timer.invalidate()
            self.timerLabel.text = NSString(format: "%0.2d:%0.2d", self.counter / 60, self.counter % 60) as String
            
            self.adviceLabel.text = "Follow the instructions and good Luck!"
            
            self.startButton.setTitle("Start", for: .normal)
            self.startButton.setTitleColor(self.timerView.backgroundColor, for: .normal)
            self.startButton.backgroundColor = UIColor.white
            self.stopButton.setTitle("Stop", for: .normal)
            self.stopButton.setTitleColor(self.timerView.backgroundColor, for: .normal)
            self.stopButton.backgroundColor = UIColor.white
        }
        alert.addAction(yesAction)
        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))

        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func toListButtonPressed(_ sender: Any) {
        guard let ingrid = dish.ingridients else { return }
        for index in 0..<ingrid.count {
            IngridiensDishVC.ingridients.append(ingrid[index])
            
            UserDefaults.standard.set(IngridiensDishVC.ingridients, forKey: "ingridients")
        }
        IngridiensDishVC.ingridients.sort()
        
        let alert = UIAlertController(title: "Attention" , message: "Ingridients added to product list, good luck in shop if you click again so ingridients will be added again", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { (alert) in
        }
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    
    
    
    
    
    // Big func of checking advice label and timer instructions
    
    func checking() {
        switch nameLabel.text {
            
        case "Hot sandwiches":
            if timerLabel.text == "00:00" {
                adviceLabel.text = "Bon appetit!"
                AudioServicesPlaySystemSound(systemSoundEnd)
            } else if timerLabel.text == "01:15" {
                adviceLabel.text = "flip the sandwich"
                displayMessegeAlert(message: "flip the sandwich")
            }
            
        case "Pasta":
            if timerLabel.text == "00:00" {
                adviceLabel.text = "Bon appetit!"
                AudioServicesPlaySystemSound(systemSoundEnd)
            } else if timerLabel.text == "09:00" {
                adviceLabel.text = "mash the water"
                displayMessegeAlert(message: "mash the water")
            } else if timerLabel.text == "07:30" {
                adviceLabel.text = "mash the water"
                displayMessegeAlert(message: "mash the water")
            } else if timerLabel.text == "06:00" {
                adviceLabel.text = "mash the water"
                displayMessegeAlert(message: "mash the water")
            } else if timerLabel.text == "04:30" {
                adviceLabel.text = "mash the water"
                displayMessegeAlert(message: "mash the water")
            } else if timerLabel.text == "03:00" {
                adviceLabel.text = "mash the water"
                displayMessegeAlert(message: "mash the water")
            } else if timerLabel.text == "01:30" {
                adviceLabel.text = "turn off fire and mash"
                displayMessegeAlert(message: "turn off fire and mash")
            } else if timerLabel.text == "00:30" {
                adviceLabel.text = "water out, butter in"
                displayMessegeAlert(message: "water out, butter in")
            }
            
        case "Pancakes":
            if timerLabel.text == "00:00" {
                adviceLabel.text = "Bon appetit!"
                AudioServicesPlaySystemSound(systemSoundEnd)
            } else if timerLabel.text == "01:00" {
                adviceLabel.text = "flip the pancake"
                displayMessegeAlert(message: "flip the pancake")
            }
            
        case "Buckwheat":
            if timerLabel.text == "00:00" {
                adviceLabel.text = "Bon appetit!"
                AudioServicesPlaySystemSound(systemSoundEnd)
            } else if timerLabel.text == "17:00" {
                adviceLabel.text = "mash the water"
                displayMessegeAlert(message: "mash the water")
            } else if timerLabel.text == "12:00" {
                adviceLabel.text = "mash the water"
                displayMessegeAlert(message: "mash the water")
            } else if timerLabel.text == "06:00" {
                adviceLabel.text = "mash the water"
                displayMessegeAlert(message: "mash the water")
            } else if timerLabel.text == "00:30" {
                adviceLabel.text = "water out, butter in"
                displayMessegeAlert(message: "water out, butter in")
            }
            
        case "Chicken chops":
            if timerLabel.text == "00:00" {
                adviceLabel.text = "Bon appetit!"
                AudioServicesPlaySystemSound(systemSoundEnd)
            } else if timerLabel.text == "05:00" {
                adviceLabel.text = "flip the chop"
                displayMessegeAlert(message: "flip the chop")
            }
            
        case "Syrniki":
            if timerLabel.text == "00:00" {
                adviceLabel.text = "Bon appetit!"
                AudioServicesPlaySystemSound(systemSoundEnd)
            } else if timerLabel.text == "03:00" {
                adviceLabel.text = "flip the syrnik"
                displayMessegeAlert(message: "flip the syrnik")
            }
          
           //
        case "Test":
            if timerLabel.text == "00:00" {
                adviceLabel.text = "Bon appetit!"
                AudioServicesPlaySystemSound(systemSoundEnd)
            } else if timerLabel.text == "00:50" {
                adviceLabel.text = "do smth1"
                displayMessegeAlert(message: "do smth1")
            } else if timerLabel.text == "00:40" {
                adviceLabel.text = "do smth2"
                displayMessegeAlert(message: "do smth2")
            } else if timerLabel.text == "00:30" {
                adviceLabel.text = "do smth3"
                displayMessegeAlert(message: "do smth3")
            }
            //
            
            
            
            
            /*
        case "eda3":
            if timerLabel.text == "00:00" {
                adviceLabel.text = "Bon appetit!"
                AudioServicesPlaySystemSound(systemSoundEnd)
            } else if timerLabel.text == "17:00" {
                adviceLabel.text = "mash the water"
                displayMessegeAlert(message: "mash the water")
            } else if timerLabel.text == "12:00" {
                adviceLabel.text = "mash the water"
                displayMessegeAlert(message: "mash the water")
            } else if timerLabel.text == "06:00" {
                adviceLabel.text = "mash the water"
                displayMessegeAlert(message: "mash the water")
            } else if timerLabel.text == "00:30" {
                adviceLabel.text = "water out, butter in"
                displayMessegeAlert(message: "water out, butter in")
            }
             */
            
            
            //Borscht
            //Sarzuela fish and seafood
            //eda5
            
            
            
            
        default:
            adviceLabel.text = "Follow the instructions and good Luck!"
        }
    }
    
    private func displayMessegeAlert(message: String) {
        AudioServicesPlaySystemSound(systemSoundAttention)
        let alert = UIAlertController(title: "Attention",
                                      message: message,
                                      preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
        let when = DispatchTime.now() + 7
        DispatchQueue.main.asyncAfter(deadline: when) {
            alert.dismiss(animated: true, completion: nil)
        }
    }
    
}


