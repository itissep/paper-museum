//
//  CountriesCollectionView.swift
//  museum
//
//  Created by The GORDEEVS on 02.03.2022.
//

import UIKit

class CountriesCollectionView: UICollectionView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
//    override func numberOfItems(inSection section: Int) -> Int {
//        return K.countries.count
//    }
//
//    override func cellForItem(at indexPath: IndexPath) -> UICollectionViewCell? {
//        let cell = self.dequeueReusableCell(withReuseIdentifier: "countryCell", for: indexPath) as! CountryCell
//        let country = K.countries[indexPath.row]
//        cell.countryImage.image = country.1
//        return cell
//    }
    
    
    override func numberOfItems(inSection section: Int) -> Int {
        return 5
    }
    
    override func cellForItem(at indexPath: IndexPath) -> UICollectionViewCell? {
        let cell = self.dequeueReusableCell(withReuseIdentifier: "countryCell", for: indexPath)
        return cell
    }

    
}
