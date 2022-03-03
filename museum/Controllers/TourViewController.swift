//
//  TourViewController.swift
//  museum
//

import UIKit



class TourViewController: UIViewController {
    
    
    let data: [Tour] = K.tours
    var selectedTour = K.tours[0]
    
    
    @IBOutlet weak var viewBtn: UIView!
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(UINib(nibName: "TourViewCell", bundle: nil), forCellReuseIdentifier: "TourReusableCell")
        
        
        let tapCollection = UITapGestureRecognizer(target: self, action: #selector(tappedCollection))
        viewBtn.addGestureRecognizer(tapCollection)
        viewBtn.isUserInteractionEnabled = true

        // Do any additional setup after loading the view.
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
        if segue.identifier == "toTourDetail" {
            guard let destination = segue.destination as? TourDetailViewController else { return }
            destination.tour = selectedTour
        } else if segue.identifier == "fromToursToMain" {
            guard let destination = segue.destination as? TourDetailViewController else { return }
            
        }
        
        
        
    }
    
    @objc func tappedCollection(){
        print("collection opening")
        performSegue(withIdentifier: "fromToursToMain", sender: nil)
    }
    
    

}

extension TourViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tour = data[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "TourReusableCell", for: indexPath) as! TourViewCell
        cell.tourTitle.text = tour.title
        cell.tourDescription.text = tour.annotation
        cell.tourImage?.image = tour.image
        return cell
    }
 
}

extension TourViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedTour = data[indexPath.row]
        performSegue(withIdentifier: "toTourDetail", sender: nil)
        
    }
}






