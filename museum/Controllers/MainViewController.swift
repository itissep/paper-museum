//
//  MainViewController.swift
//  museum
//

import UIKit

class MainViewController: UIViewController, UIGestureRecognizerDelegate {
    
    let popular = K.popular
    let countries = K.countries
    let years = K.years
    
    var selectedPiece = K.showpieces[0]

    @IBOutlet weak var popularCollection: UICollectionView!
    @IBOutlet weak var countryCollection: UICollectionView!
    
    @IBOutlet weak var yearsCollection: UICollectionView!
    
    @IBOutlet weak var museumImage: UIImageView!
    
    @IBOutlet weak var toursImage: UIImageView!
    
    @IBOutlet weak var tempImage: UIImageView!
    
    
    @IBOutlet weak var tempView: UIView!
    @IBOutlet weak var museumView: UIView!
    @IBOutlet weak var toursView: UIView!
    
    
    var titleToPass = ""
    var dataToPass: [Showpiece] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let tempEx = UITapGestureRecognizer(target: self, action: #selector(tappedTemp))
        tempView.addGestureRecognizer(tempEx)
        tempView.isUserInteractionEnabled = true
        
        let aboutMuseum = UITapGestureRecognizer(target: self, action: #selector(tappedMuseum))
        museumView.addGestureRecognizer(aboutMuseum)
        museumView.isUserInteractionEnabled = true
        
        let toTours = UITapGestureRecognizer(target: self, action: #selector(tappedTours))
        toursView.addGestureRecognizer(toTours)
        toursView.isUserInteractionEnabled = true
        
    }
    
    @objc func tappedTemp(){
        performSegue(withIdentifier: "toTemp", sender: nil)
    }
    
    @objc func tappedMuseum(){
        performSegue(withIdentifier: "fromMainToAbout", sender: nil)
    }
    
    @objc func tappedTours(){
        performSegue(withIdentifier: "toToursFromMain", sender: nil)
    }
    


    // MARK: - Navigation

     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

         
         
         if segue.identifier == "toTemp" {
             guard let destination = segue.destination as? TourDetailViewController else { return }
             destination.tour = K.tours[0]
         } else if segue.identifier == "toReusableTable" {
             guard let destination = segue.destination as? ReusableTableViewController else { return }
             destination.titleVieSegue = self.titleToPass
             destination.dataViaSegue = self.dataToPass
             
         } else if segue.identifier == "toShowpieceFromMain"{
             guard let destination = segue.destination as? ShowpieceDetailsViewController else { return }
             destination.showpiece = self.selectedPiece
             
         } else if segue.identifier == "fromMainToAbout"{
             guard let destination = segue.destination as? ShowpieceDetailsViewController else { return }
             destination.showpiece = self.selectedPiece
             
         }
         
         
     }

}

extension MainViewController: UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == self.popularCollection {
            let cell = collectionView.cellForItem(at: indexPath) as! PopularViewCell
            
            self.selectedPiece = Showpiece.findByName(name: cell.popularLabel.text!)
            
            performSegue(withIdentifier: "toShowpieceFromMain", sender: nil)
            
        } else if collectionView == self.countryCollection {
            
            self.titleToPass = K.countries[indexPath.row].0
            self.dataToPass = Showpiece.findByCountry(country: K.countries[indexPath.row].0)
            
            performSegue(withIdentifier: "toReusableTable", sender: nil)
            
        } else {

            let year = (K.years[indexPath.row])
            self.titleToPass = "\(year)-е годы"
            self.dataToPass = Showpiece.findByYear(year: year)
            performSegue(withIdentifier: "toReusableTable", sender: nil)
            
        }

    }
}


extension MainViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == self.popularCollection {
            return popular.count
        } else if collectionView == self.countryCollection {
            return countries.count
        } else {
            return years.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == self.yearsCollection {
            
            let cell = collectionView
                .dequeueReusableCell(withReuseIdentifier: "yearsCell", for: indexPath) as! YearsCell
            let item = years[indexPath.row]
            cell.yearsLabel.text = String(item)
            return cell
            
        } else if collectionView == self.countryCollection {
            
            let cell = collectionView
                .dequeueReusableCell(withReuseIdentifier: "countryCell", for: indexPath) as! CountryCell
            let item = countries[indexPath.row]
            cell.countryImage.image = item.1
            cell.countryName = item.0
            return cell
            
        } else {
            
            let cell = collectionView
                .dequeueReusableCell(withReuseIdentifier: "popularCell", for: indexPath) as! PopularViewCell
            let name = popular[indexPath.row]
            let item = Showpiece.findByName(name: name)
            cell.popularLabel.text = item.title
            cell.popularImage.image = item.image
            return cell
            
        }
    }
    
    
}
