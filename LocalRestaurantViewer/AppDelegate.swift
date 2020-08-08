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
    var dependencies = Dependencies()
    var appCoordinator: AppCoordinator?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        dependencies.lManager.requestAlwaysAuthorization()
        dependencies.lManager.delegate = self
        dependencies.lManager.requestLocation()
        
        appCoordinator = AppCoordinator(window: window!, dependencies: dependencies)
        
        return true
    }
}

extension AppDelegate: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("get location failed")
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else { return }
        dependencies.dataProvider.fetchData(lat: location.coordinate.latitude, long: location.coordinate.longitude)
    }
}
