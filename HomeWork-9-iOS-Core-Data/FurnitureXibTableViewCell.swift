//
//  FurnitureXibTableViewCell.swift
//  HomeWork-9-iOS-Core-Data
//
//  Created by Alla on 1/27/19.
//  Copyright © 2019 AndreiSavchenko. All rights reserved.
//

import UIKit

class FurnitureXibTableViewCell: UITableViewCell {

    static let reuseIdentifier: String = "FurnitureCell"
    
    @IBOutlet weak var furnitureImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBAction func addToCartButton(_ sender: UIButton) {
        print("Add Cart ;-)")
    }
    
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        // Initialization code
//    }
//
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }
    
}
