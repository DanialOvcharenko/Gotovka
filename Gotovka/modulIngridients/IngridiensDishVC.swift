//
//  IngridiensDishVC.swift
//  Gotovka
//
//  Created by Mac on 05.08.2022.
//

import UIKit

class IngridiensDishVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let cellID = "ingridientid"
    static var ingridients = [String]()
    
    static var status : [Bool] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let data = UserDefaults.standard.object(forKey: "ingridients") as? [String] {
            IngridiensDishVC.ingridients = data
        }
        
        if let status = UserDefaults.standard.object(forKey: "status") as? [Bool] {
            IngridiensDishVC.status = status
        }
        
        reloadStatements()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    @IBAction func DeleteAllPressed(_ sender: Any) {
        
        if IngridiensDishVC.ingridients.isEmpty {
            
            let alertCancel = UIAlertController(title: "Хммм" , message: "Ты что собрался удалять, тут ведь и так пусто", preferredStyle: .alert)
            alertCancel.addAction(UIAlertAction(title: "Точно", style: .cancel, handler: nil))
            self.present(alertCancel, animated: true, completion: nil)
            let when = DispatchTime.now() + 3
            DispatchQueue.main.asyncAfter(deadline: when) {
                alertCancel.dismiss(animated: true, completion: nil)
            }
            
        } else {
            
            let alert = UIAlertController(title: "Ты уверен?" , message: "Реально хочешь все удалить?", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "Да", style: .default) { (alert) in
                
                IngridiensDishVC.ingridients.removeAll()
                UserDefaults.standard.set(IngridiensDishVC.ingridients, forKey: "ingridients")
                self.tableView.reloadData()
            }
            alert.addAction(UIAlertAction(title: "Отмена", style: .cancel, handler: nil))
            alert.addAction(okAction)
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    @IBAction func reloadStatementButtonPressed(_ sender: Any) {
        reloadStatements()
        tableView.reloadData()
    }
    
    
    func reloadStatements() {
        var i = 0
        repeat {
            IngridiensDishVC.status.append(false)
            i += 1
            UserDefaults.standard.set(IngridiensDishVC.status, forKey: "status")
        } while i < IngridiensDishVC.ingridients.count
    }
    
    @objc func takePress(button: UIButton) {
        IngridiensDishVC.status[button.tag] = !IngridiensDishVC.status[button.tag]
        UserDefaults.standard.set(IngridiensDishVC.status, forKey: "status")
        tableView.reloadData()
    }
    
}

extension IngridiensDishVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return IngridiensDishVC.ingridients.count
    }
        

     
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID) as! IngridientsTableViewCell
        cell.label.text = IngridiensDishVC.ingridients[indexPath.row]
        cell.button.tag = indexPath.row
        cell.button.addTarget(self, action: #selector(takePress), for: .touchUpInside)
        cell.button.setTitle("", for: .normal)
        if IngridiensDishVC.status[indexPath.row] {
            cell.button.setTitle("Taken", for: .normal)
            cell.button.backgroundColor = UIColor.systemBlue
            cell.button.setTitleColor(UIColor.white, for: .normal)
        } else {
            cell.button.setTitle("Take", for: .normal)
            cell.button.backgroundColor = UIColor.white
            cell.button.setTitleColor(UIColor.systemBlue, for: .normal)
        }
        cell.selectionStyle = .none
        return cell
       
    }
    
    
}

extension IngridiensDishVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tableView.beginUpdates()
            IngridiensDishVC.ingridients.remove(at: indexPath.row)
            
            UserDefaults.standard.set(IngridiensDishVC.ingridients, forKey: "ingridients")
            
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.endUpdates()
        }
    }
}
