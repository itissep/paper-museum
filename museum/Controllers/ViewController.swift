//
//  ViewController.swift
//  museum
//


import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var museumLabel: UILabel!
    @IBOutlet weak var PAPERlabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    
    let data: [WelcomeCell] = [
        WelcomeCell(title: "Аудиогиды", label: "Воспользуйтесь нашими авторскими экскурсиями", segueId: "toMobileEx"),
        WelcomeCell(title: "Виртуальная коллекция", label: "Исследуйте нашу коллекцию из любого уголка мира", segueId: "toMainOnline")
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}


extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let segue = data[indexPath.row].segueId
        performSegue(withIdentifier: segue, sender: nil)
    }

    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "welcomeCell", for: indexPath)
        cell.textLabel?.text = data[indexPath.row].title
        
        cell.textLabel?.textColor = UIColor.white
        cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 16.0)
        cell.detailTextLabel?.text = data[indexPath.row].label
        
        cell.tintColor = UIColor.white
        
        
        if indexPath.row == data.count-1 {
            cell.separatorInset = .zero
        }
        
        
        
        return cell
    }
    
    
}
