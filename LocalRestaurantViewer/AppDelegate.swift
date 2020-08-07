//
//  AppDelegate.swift
//  LocalRestaurantViewer
//
//  Created by Zoilo Mercedes on 8/7/20.
//  Copyright © 2020 Zoilo Mercedes. All rights reserved.
//

import UIKit
import CoreLocation

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let lManager = CLLocationManager()
    var data = DataProvider()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        lManager.requestAlwaysAuthorization()
        lManager.delegate = self
        lManager.requestLocation()
        
        return true
    }
}

extension AppDelegate: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("get location failed")
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else { return }
        data.fetchData(lat: location.coordinate.latitude, long: location.coordinate.longitude)
    }
}
