//
//  Restaurant.swift
//  LocalRestaurantViewer
//
//  Created by Zoilo Mercedes on 8/7/20.
//  Copyright © 2020 Zoilo Mercedes. All rights reserved.
//

import Foundation

class Restaurant {
    let name: String
    let rating: Float
    let imageUrl: String
    let distance: Float
    
    init(n: String, r: Float, i: String, d: Float) {
        name = n
        rating = r
        imageUrl = i
        distance = d
    }
}
