
import UIKit

class DishListVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let cellID = "DishTableViewCell"
    let modelDish = Dish()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}

extension DishListVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let section = modelDish.dishes[section]
        return section.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return modelDish.dishes.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "easy"
        } else if section == 1 {
            return "normal"
        } else {
            return "hard"
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID) as! DishTableViewCell
        let section = modelDish.dishes[indexPath.section]
        let dish = section[indexPath.row]
        
        cell.nameLabel.text = dish.name
        cell.levelLabel.text = "(\(dish.TypeOfDish))"
        cell.countryLabel.text = dish.countryOfOrigin
        cell.selectionStyle = .none
        
        return cell
    }
}

extension DishListVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let section = modelDish.dishes[indexPath.section]
        let dish = section[indexPath.row]
        
        let alert = UIAlertController(title: "\(dish.name): (\(dish.countryOfOrigin))" , message: dish.descript, preferredStyle: .actionSheet)
        let profileAction = UIAlertAction(title: "More", style: .default) { (alert) in
            self.performSegue(withIdentifier: "goToDish", sender: indexPath)
        }
        
        alert.addAction(profileAction)
        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToDish" {
            let vc = segue.destination as! DishDeteilVC
            let indexPath = sender as! IndexPath
            
            let section = modelDish.dishes[indexPath.section]
            let dish = section[indexPath.row]
            
            vc.dish = dish
        }
    }
}

