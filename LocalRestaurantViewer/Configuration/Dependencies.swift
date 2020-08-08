//
//  Dependencies.swift
//  LocalRestaurantViewer
//
//  Created by Zoilo Mercedes on 8/7/20.
//  Copyright © 2020 Zoilo Mercedes. All rights reserved.
//

import Foundation
import CoreLocation

final class Dependencies {
    lazy var lManager = CLLocationManager()
    lazy var dataProvider = DataProvider()
}
