//
//  AddingViewController.swift
//  Gotovka
//
//  Created by Mac on 16.08.2022.
//

import UIKit

class AddingViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var button: UIButton!
    
    var ingridient = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func addButtonPressed(_ sender: Any) {
        
        guard let str = textField.text else { return }
        var check = true
        
        
        if str.contains(",") || str.contains(".") || str.contains("/") || str.contains("!") || str.contains("?") || str.contains(";") || str.contains(":") || str.contains("*") || str.contains("^") || str.contains("'") || str.contains("<") || str.contains(">") || str.contains("`") || str.contains("-") || str.contains("_") || str.contains("+") || str.contains("=") || str.contains("[") || str.contains("]") || str.contains("{") || str.contains("}") || str.contains("~") {
            check = false
        }
        
        if textField.text == "" || textField.text?.first == " " || textField.text?.last == " " || check == false {
                
            let alert = UIAlertController(title: "Внимание, чтото введено не так" , message: "Просто введи название без пробелов спереди и сзади", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default) { (alert) in
            }
            alert.addAction(okAction)
            self.present(alert, animated: true, completion: nil)
                
            textField.text = ""
        } else {
            ingridient = textField.text ?? "ошибка"
            IngridiensDishVC.ingridients.append(ingridient)
            
            UserDefaults.standard.set(IngridiensDishVC.ingridients, forKey: "ingridients")
            //Обновление ЮзерДефолтс по ключу сразу после добавления новых данных
            
            print(IngridiensDishVC.ingridients)
                
            guard let product = textField.text else { return }
            displayAlert(message: "Ты добавил '\(product)' в список")
                
            textField.text = ""
        }
    }
    
    private func displayAlert(message: String) {
        let alert = UIAlertController(title: "Есть",
                                      message: message,
                                      preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
        let when = DispatchTime.now() + 3
        DispatchQueue.main.asyncAfter(deadline: when) {
            alert.dismiss(animated: true, completion: nil)
        }
    }
    
}
