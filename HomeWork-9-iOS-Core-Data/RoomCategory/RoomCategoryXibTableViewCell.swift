//
//  RoomCategoryXibTableViewCell.swift
//  HomeWork-9-iOS-Core-Data
//
//  Created by Alla on 2/5/19.
//  Copyright © 2019 AndreiSavchenko. All rights reserved.
//

import UIKit

class RoomCategoryXibTableViewCell: UITableViewCell {

    static let reuseIdentifier: String = "RoomCategoryCell"
    @IBOutlet weak var roomCategoryImageView: UIImageView!
    @IBOutlet weak var nameRoomLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
