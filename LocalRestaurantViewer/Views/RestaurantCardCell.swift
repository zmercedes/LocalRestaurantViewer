//
//  RestaurantCardCell.swift
//  LocalRestaurantViewer
//
//  Created by Zoilo Mercedes on 8/7/20.
//  Copyright © 2020 Zoilo Mercedes. All rights reserved.
//

import UIKit

class RestaurantCardCell: UITableViewCell {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var restaurantImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        containerView.layer.cornerRadius = 5
        nameLabel.adjustsFontSizeToFitWidth = true
    }
    
    override func prepareForReuse() {
        restaurantImage.image = nil
        nameLabel.text = nil
        ratingLabel.text = nil
    }
    
}
