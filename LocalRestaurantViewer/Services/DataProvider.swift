//
//  DataProvider.swift
//  LocalRestaurantViewer
//
//  Created by Zoilo Mercedes on 8/7/20.
//  Copyright © 2020 Zoilo Mercedes. All rights reserved.
//

import Foundation
import CoreLocation

class DataProvider {
    
    let locationManager: CLLocationManager
    
    init(location: CLLocationManager) {
        locationManager = location
        fetchData()
    }
    
    func fetchData() {
        let url = URL(string: "https://api.yelp.com/v3/businesses/search")!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        request.setValue("", forHTTPHeaderField: "Authorization")
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            
        }
        
    }
}
