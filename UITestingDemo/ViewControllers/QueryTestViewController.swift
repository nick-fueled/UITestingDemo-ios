//
//  QueryTestViewController.swift
//  UITesting-Example
//
//  Created by Nick McConnell on 9/13/15.
//  Copyright © 2015 Nick McConnell. All rights reserved.
//

import UIKit

class QueryTestViewController: UIViewController {

    @IBOutlet var firstLabel: UILabel!
    @IBOutlet var secondLabel: UILabel!
    @IBOutlet var pendingDataView: UIView!
    @IBOutlet var activityIndicatorView: UIActivityIndicatorView!
    @IBOutlet var dataLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
    }

    @IBAction func mainButtonTapped(sender: AnyObject) {
        firstLabel.text = "Tapped"
    }
    
    private func dummyFunction() {
        secondLabel.alpha = 0.1

    }
    
    private func fetchData() {
        activityIndicatorView.hidden = false;
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 6 * Int64(NSEC_PER_SEC)), dispatch_get_main_queue()) {
            self.showData();
        }
    }
    
    private func showData() {
        activityIndicatorView.removeFromSuperview()
        dataLabel.hidden = false
        dataLabel.text = "Data Loaded"
        
    }
}
