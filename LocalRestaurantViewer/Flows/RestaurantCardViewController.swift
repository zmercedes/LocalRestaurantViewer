//
//  RestaurantCardViewController.swift
//  LocalRestaurantViewer
//
//  Created by Zoilo Mercedes on 8/7/20.
//  Copyright © 2020 Zoilo Mercedes. All rights reserved.
//

import UIKit

class RestaurantCardViewController: UIViewController {
    
    @IBOutlet weak var slidingView: UIView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var tableViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    var currentCell: Int = 0
    
    init() {
        super.init(nibName: nil, bundle: nil)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.isScrollEnabled = false
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        if(currentCell>0){
            currentCell=currentCell-1;
//            let indexPath = IndexPath(row: currentCell, section: 0)
            slidingView.slideInFromLeft(duration: 0.5)
//            tableView.scrollToRow(at: indexPath, at: .top, animated: false)
        }
    }
    
    @IBAction func nextButtonPressed(_ sender: Any) {
        if(currentCell<10){
            currentCell=currentCell+1;
//            let indexPath = IndexPath(row: currentCell, section: 0)
            slidingView.slideInFromRight(duration: 0.5)
//            tableView.scrollToRow(at: indexPath, at: .top, animated: false)
        }
    }
    

}

extension RestaurantCardViewController: UITableViewDelegate {
    
}
