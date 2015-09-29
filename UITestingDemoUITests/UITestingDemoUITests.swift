//
//  UITestingDemoUITests.swift
//  UITestingDemoUITests.
//
//  Created by Nick McConnell on 9/15/15.
//  Copyright © 2015 Nick McConnell. All rights reserved.
//

import XCTest

class UITestingDemoUITests: XCTestCase {
    
    let app = XCUIApplication()
    
    private var launched = false

    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        launchIfNecessary()
    }
    private func launchIfNecessary() {
        if !launched {
            launched = true
            app.launchEnvironment = ["animations": "1"]
            app.launch()
        }
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testQueryScene() {
        
        let labelByTextQuery = app.staticTexts["Label"]
        XCTAssertTrue(labelByTextQuery.exists)
        
        let mainButton = app.buttons["Button"]
        mainButton.tap()
        
        XCTAssertEqual(labelByTextQuery.exists,false)

        let newLabelText = app.staticTexts["Tapped"]
        XCTAssertTrue(newLabelText.exists)
        
        let dataLabel = app.staticTexts["Data Loaded"]
        let exists = NSPredicate(format: "exists == true")
        expectationForPredicate(exists, evaluatedWithObject: dataLabel, handler: nil)
        waitForExpectationsWithTimeout(60, handler: nil) //big margin of error
        
    }
    
    
    func testFlow() {
        testScreenIntro()
        testScreenTable()
    }
    
    
    func testScreenIntro() {
        
        let userTextField = app.textFields["User Name"]
        userTextField.tap()
        app.textFields["User Name"].typeText("Monkey1")
        
        let passwordSecureTextField = XCUIApplication().secureTextFields["Password"]
        passwordSecureTextField.tap()
        passwordSecureTextField.typeText("password")
        
        app.buttons["Launch App"].tap()
        
        
    }
    
    func testScreenTable() {
        
        let masterNavigationBar = app.navigationBars["Master"]
        // Alternative: let masterNavigationBar = app.navigationBars.element
        
        let addButton = masterNavigationBar.buttons["Add"]
        // Alternative: let addButton = app.buttons["Add"]
        
        addButton.tap()
        addButton.tap()
        addButton.tap()
        masterNavigationBar.buttons["Edit"].tap()
        
        let tablesQuery = app.tables
        let table = tablesQuery.element
        
        //Changed: let cell = table.cells.elementBoundByIndex(2)
        let cell = app.cells.elementBoundByIndex(2)
        
        //let cell = app.cells.containingType(.StaticText, identifier: "Baboon").element
        
        XCTAssertTrue(cell.exists)
        
        // Changed: let cellButton = cell.buttons.elementBoundByIndex(0)
        let cellButton = cell.buttons.element
        cellButton.tap()
        tablesQuery.buttons["Delete"].tap()
        let count = table.cells.count
        XCTAssertTrue(count == 2)
        
    }
    

    
    func testUIDummy() {
        
        let labelByTextQuery = app.staticTexts["Label"]
        XCTAssertTrue(labelByTextQuery.exists)

        
    }
    
//    func testForMeetup() {
//        
//        let userNameTextField = app.textFields["User Name"]
//        userNameTextField.tap()
//        userNameTextField.typeText("hello")
//        
//        let passwordSecureTextField = app.secureTextFields["Password"]
//        passwordSecureTextField.tap()
//        passwordSecureTextField.typeText("password")
//        
//        app.buttons["Launch App"].tap()
//        
//        let addButton = app.buttons["Add"]
//        addButton.tap()
//        addButton.tap()
//        addButton.tap()
//        app.buttons["Edit"].tap()
//        
//        let tablesQuery = app.tables
//        let cell = tablesQuery.cells.containingType(.StaticText, identifier: "Tamarin").element
//        cell.buttons.elementBoundByIndex(0).tap()
//        cell.buttons["Delete"].tap()
//        
//        
//        
//    }
    
}
