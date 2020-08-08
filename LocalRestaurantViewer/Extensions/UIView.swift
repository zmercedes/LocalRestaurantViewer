//
//  UIView.swift
//  LocalRestaurantViewer
//
//  Created by Zoilo Mercedes on 8/7/20.
//  Copyright © 2020 Zoilo Mercedes. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    func slideInFromRight(duration: TimeInterval = 1, completionDelegate: AnyObject? = nil) {
        let slideInTransition = CATransition()
        
        if let delegate: AnyObject = completionDelegate {
            slideInTransition.delegate = delegate as? CAAnimationDelegate
        }
        
        slideInTransition.type = CATransitionType.push
        slideInTransition.subtype = CATransitionSubtype.fromRight
        slideInTransition.duration = duration
        slideInTransition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        slideInTransition.fillMode = CAMediaTimingFillMode.removed
        
        self.layer.add(slideInTransition, forKey: "slideInTransition")
    }
    
    func slideInFromLeft(duration: TimeInterval = 1, completionDelegate: AnyObject? = nil) {
        let slideInTransition = CATransition()
        
        if let delegate: AnyObject = completionDelegate {
            slideInTransition.delegate = delegate as? CAAnimationDelegate
        }
        
        slideInTransition.type = CATransitionType.push
        slideInTransition.subtype = CATransitionSubtype.fromLeft
        slideInTransition.duration = duration
        slideInTransition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        slideInTransition.fillMode = CAMediaTimingFillMode.removed
        
        self.layer.add(slideInTransition, forKey: "slideInTransition")
    }
}
