//
//  TourViewCell.swift
//  museum
//
//  Created by The GORDEEVS on 02.03.2022.
//

import UIKit

class TourViewCell: UITableViewCell {

    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var tourTitle: UILabel!
    @IBOutlet weak var tourDescription: UILabel!
    @IBOutlet weak var tourImage: UIImageView!
    
    var tour = Tour(title: "", author: "", annotation: "", description: "", collection: [], image: #imageLiteral(resourceName: "avstriya2"))
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
    }
    
//    override func layoutSubviews() {
//        super.layoutSubviews()
//
//        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
//    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
