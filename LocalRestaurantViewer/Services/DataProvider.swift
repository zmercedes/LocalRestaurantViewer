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
    
    init() {}
    
    func fetchData(lat: Double, long: Double) {
        var components = URLComponents(string: "https://api.yelp.com/v3/businesses/search")!
        let queryItems = [
            "latitude":"\(lat)",
            "longitude":"\(long)",
            "radius": "800" // 1 mile
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
        newRestaurants.sort { $0.distance < $1.distance }
        print("\(newRestaurants.count) added.")
    }
}
