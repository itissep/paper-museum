//
//  ShowpieceDetailsViewController.swift
//  museum
//


import UIKit

class ShowpieceDetailsViewController: UIViewController {
    
    var showpiece: Showpiece?

    @IBOutlet weak var mainImage: UIImageView!
    @IBOutlet weak var bgImage: UIImageView!
    
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var publishedLabel: UILabel!
    @IBOutlet weak var languageLAbel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        guard let showpiece = showpiece else { return }
        mainImage.image = showpiece.image
        bgImage.image = showpiece.image
        
        countryLabel.text = showpiece.country
        titleLabel.text = showpiece.title
        languageLAbel.text = showpiece.language
        descriptionLabel.text = showpiece.description
        
        publishedLabel.text = "\(showpiece.publisher) в \(showpiece.time)"
        
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
