//
//  ReusableListCell.swift
//  museum
//


import UIKit

class ReusableListCell: UITableViewCell {

    @IBOutlet weak var cellImage: UIImageView!
    @IBOutlet weak var cellTitile: UILabel!
    @IBOutlet weak var CellCountry: UILabel!
    @IBOutlet weak var cellYear: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
