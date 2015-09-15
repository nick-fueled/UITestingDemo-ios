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

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func mainButtonTapped(sender: AnyObject) {
        firstLabel.text = "Tapped"
    }
}
