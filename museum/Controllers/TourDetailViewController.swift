//
//  TourDetailViewController.swift
//  museum
//

import UIKit

class TourDetailViewController: UIViewController {
    
    var tour:Tour?

    @IBOutlet weak var tourTitle: UILabel!
    @IBOutlet weak var tourName: UILabel!
    @IBOutlet weak var coverImage: UIImageView!
    @IBOutlet weak var tourDescription: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    
    
    var selectedPiece = K.showpieces[0]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let tour = tour else { return }
        tourTitle.text = tour.title
        tourName.text = tour.author
        coverImage.image = tour.image
        tourDescription.text = tour.description
        
    }
    
    @IBAction func onPlayBtn(_ sender: UIButton) {
        print("pressed on play")
    }
    @IBAction func onMapBtn(_ sender: UIButton) {
        print("pressed on map")
    }
    

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "fromTourToPiece" {
            
            guard let destination = segue.destination as? ShowpieceDetailsViewController else { return }
            destination.showpiece = self.selectedPiece
        }
    
    
    
    }
}

extension TourDetailViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        let name = cell?.textLabel?.text
        self.selectedPiece = Showpiece.findByName(name: name!)
        performSegue(withIdentifier: "fromTourToPiece", sender: nil)
    }
}

extension TourDetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let tour = tour {
            return tour.collection.count
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "timelineCell", for: indexPath)
        if let tour = tour {
            let item = tour.collection[indexPath.row]
            cell.textLabel?.text = item.title
            cell.detailTextLabel?.text = item.time
        }
        
        return cell
    }
    
    
}
