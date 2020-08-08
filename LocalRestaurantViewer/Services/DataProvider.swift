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
    
    let restaurants = Dynamic<[Restaurant]>([])
    var latitude: Double = 0
    var longitude: Double = 0
    var currentRadius: Int = 800
    var currentOffset: Int = 0
    
    func fetchData(lat: Double, long: Double) {
        latitude = lat
        longitude = long
        var components = URLComponents(string: "https://api.yelp.com/v3/businesses/search")!
        let queryItems = [
            "latitude":"\(lat)",
            "longitude":"\(long)",
            "radius": "\(currentRadius)", // 1 mile
            "sort_by": "distance",
            "offset": "\(currentOffset)"
        ]
        components.queryItems = queryItems.map { (key, value) in
            URLQueryItem(name: key, value: value)
        }
        var request = URLRequest(url: components.url!)
        request.httpMethod = "GET"
        
        request.setValue(Constants.APIkey.yelp, forHTTPHeaderField: "Authorization")
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("client error: \(error.localizedDescription)")
                return
            }
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                print("server error: \(response)")
                return
            }
            if let mime = httpResponse.mimeType, mime == "application/json", let data = data {
                self.decodeJson(data: data)
                
            }
        }
        task.resume()
    }
    
    func expandSearch()-> Void {
        currentOffset = currentOffset + 20
        fetchData(lat: latitude, long: longitude)
    }
    
    func decodeJson(data: Data){
        var json: Any?
        do {
            json = try JSONSerialization.jsonObject(with: data, options: [])
        } catch {
            print("Cannot decode")
            return
        }
        
        var newRestaurants: [Restaurant] = []
        
        let body = json as! [String: Any]
        let businesses = body["businesses"] as! [[String: Any]]
        for business in businesses {
            let name = business["name"] as! String
            let rating = business["rating"] as! Float
            let image = business["image_url"] as! String
            let distance = business["distance"] as! NSNumber
            newRestaurants.append(Restaurant(n: name, r: rating, i: image, d: distance.floatValue))
        }
        if currentOffset > 0 {
            var currentRestaurants = restaurants.value
            currentRestaurants.append(contentsOf: newRestaurants)
            restaurants.value = currentRestaurants
        } else {
            restaurants.value = newRestaurants
        }
    }
}
