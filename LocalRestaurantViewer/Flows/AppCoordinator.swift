//
//  AppCoordinator.swift
//  LocalRestaurantViewer
//
//  Created by Zoilo Mercedes on 8/7/20.
//  Copyright © 2020 Zoilo Mercedes. All rights reserved.
//

import UIKit

class AppCoordinator: Coordinator {
    
    private let window: UIWindow
    private let rootViewController: UIViewController
    private let dependencies: Dependencies
    
    init(window: UIWindow, dependencies: Dependencies) {
        self.window = window
        self.dependencies = dependencies
        self.rootViewController = RestaurantCardViewController(dependencies: dependencies)
        self.window.rootViewController = rootViewController
        self.window.makeKeyAndVisible()
    }
    
    func start() {
        
    }
    
    func stop() {
        
    }
    
    
}
