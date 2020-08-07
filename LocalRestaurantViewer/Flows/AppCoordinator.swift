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
    
    init(window: UIWindow) {
        self.rootViewController = UIViewController()
        self.window = window
        self.window.rootViewController = rootViewController
        self.window.backgroundColor = .purple
        self.window.makeKeyAndVisible()
    }
    
    func start() {
        
    }
    
    func stop() {
        
    }
    
    
}
