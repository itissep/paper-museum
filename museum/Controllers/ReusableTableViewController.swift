//
//  ReusableTableViewController.swift
//  museum
//


import UIKit

class ReusableTableViewController: UIViewController {
    @IBOutlet weak var titleToChange: UILabel!
    
    var titleVieSegue: String?
    var dataViaSegue:[Showpiece]?
    
    
    var selectedPiece = K.showpieces[0]
    
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let title = titleVieSegue else { return }
        titleToChange.text = title

        // Do any additional setup after loading the view.
    }
    

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "fromUseListToPiece" {
            
            guard let destination = segue.destination as? ShowpieceDetailsViewController else { return }
            destination.showpiece = self.selectedPiece
    }
    

}
}

extension ReusableTableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! ReusableListCell
        let name = cell.cellTitile.text!
        self.selectedPiece = Showpiece.findByName(name: name)
        performSegue(withIdentifier: "fromUseListToPiece", sender: nil)
    }
}


extension ReusableTableViewController: UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reucableListCell", for: indexPath) as! ReusableListCell
        if let item = dataViaSegue?[indexPath.row] {
            cell.cellYear.text = String(item.time)
            cell.CellCountry.text = item.country
            cell.cellTitile.text = item.title
            cell.cellImage.image = item.image
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataViaSegue?.count ?? 0
    }
}

