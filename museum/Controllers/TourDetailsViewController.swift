//
//  TourDetailsViewController.swift
//  museum
//
//  Created by The GORDEEVS on 02.03.2022.
//

import UIKit


class TourDetailsViewController: UIViewController {
    
//    var tour: Tour?
    
    
//    var tour: Tour = K.tours[0]
    
    @IBOutlet weak var tourLabel: UILabel!
    @IBOutlet weak var exNameLabel: UILabel!
    @IBOutlet weak var tourDescription: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var coverImage: UIImageView!
    
//    var timelineItems: [ShowpieceTime]?
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        scrollView.layer.cornerRadius = 16
//        if let tour = tour {
//            tourLabel.text = tour.title
//            exNameLabel.text = tour.author
//            tourDescription.text = tour.description
//            coverImage.image = tour.image
//        }
        
    
        

    }
    
    
    @IBAction func onPlayBtn(_ sender: UIButton) {
        print("play btn pressed")
    }
    @IBAction func onMapBtn(_ sender: UIButton) {
        print("map btn pressed")
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


extension TourDetailsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
//        return timelineItems?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let item = timelineItems?[indexPath.row]
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "timelineCell", for: indexPath)
        cell.textLabel?.text = "wow"
        
        cell.textLabel?.textColor = UIColor.white
        cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 16.0)
        cell.detailTextLabel?.text = "fuck"
        
        cell.tintColor = UIColor.white
        return cell
    }
    
    
}




