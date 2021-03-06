//
//  UITestingDemoTests.swift
//  UITestingDemoTests
//
//  Created by Nick McConnell on 9/15/15.
//  Copyright © 2015 Nick McConnell. All rights reserved.
//

import XCTest
@testable import UITestingDemo

class UITestingDemoTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    
    func testNumberOfSections() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let controller : MasterViewController = MasterViewController()
        let tableview = controller.view as? UITableView
        XCTAssert(controller.numberOfSectionsInTableView(tableview!) == 1)
        let objectCount : Int = controller.objects.count
        XCTAssert(controller.tableView(tableview!, numberOfRowsInSection: 1) == objectCount)
    }
    
    func testDummy() {
        XCTAssertTrue(true)
    }
    
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
    
}
