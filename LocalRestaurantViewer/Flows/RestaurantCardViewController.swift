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
    
    var restaurants: [Restaurant] = [] {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    let disposeBag = DisposeBag()
    
    var setupView: (()-> Void)?
    var expandSearch: (()->Void)
    
    var currentCell: Int = 0
    
    init(dependencies: Dependencies) {
        expandSearch = {
            dependencies.dataProvider.expandSearch()
        }
        super.init(nibName: nil, bundle: nil)
        setupView = { [unowned self] in
            self.tableView.register(RestaurantCardCell.self)
            self.tableView.dataSource = self
            self.tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
            self.tableView.isScrollEnabled = false
            
            dependencies.dataProvider.restaurants.observe { restaurants in
                self.restaurants = restaurants
            }.dispose(with: self.disposeBag)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView!()
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        let indexPath = IndexPath(row: currentCell, section: 0)
        tableView.scrollToRow(at: indexPath, at: .middle, animated: false)
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        if(currentCell>0){
            currentCell=currentCell-1;
            let indexPath = IndexPath(row: currentCell, section: 0)
            slidingView.slideInFromLeft(duration: 0.4)
            tableView.scrollToRow(at: indexPath, at: .middle, animated: false)
        }
    }
    
    @IBAction func nextButtonPressed(_ sender: Any) {
        if(currentCell<restaurants.count-1){
            if currentCell >= restaurants.count-5 {
                expandSearch()
            }
            currentCell=currentCell+1;
            let indexPath = IndexPath(row: currentCell, section: 0)
            slidingView.slideInFromRight(duration: 0.4)
            tableView.scrollToRow(at: indexPath, at: .middle, animated: false)
        }
    }
}

extension RestaurantCardViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurants.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let restaurant = restaurants[indexPath.row]
        let cell: RestaurantCardCell = tableView.dequeueReusableCell(forIndexPath: indexPath)
        cell.nameLabel.text = restaurant.name
        cell.ratingLabel.text = "\(restaurant.rating)/5"
        if let url = URL(string: restaurant.imageUrl) {
            do {
                let data = try Data(contentsOf: url)
                let image = UIImage(data: data)!
                cell.restaurantImage.image = image
            } catch {
                print("could not get image for \(restaurant.name)")
            }
        } else {
            print("could not get image for \(restaurant.name)")
        }
        
        
        return cell
    }
    
}
