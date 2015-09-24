//
//  UITestingDemoUITests.swift
//  UITestingDemoUITests
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
    
    
    func testFlow() {
        testScreenIntro()
        testScreenTable()
    }
    
    
    func testScreenIntro() {
        
        let userTextField = app.textFields["User Name"]
        userTextField.tap()
        app.textFields["User Name"].typeText("Hello")
        
        let passwordSecureTextField = XCUIApplication().secureTextFields["Password"]
        passwordSecureTextField.tap()
        passwordSecureTextField.typeText("password")
        
        //EXAMPLE: app.buttons.element.tap() - fail
        app.buttons["Launch App"].tap()
        
        
    }
    
    func testScreenTable() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        let masterNavigationBar = app.navigationBars["Master"]
        let addButton = masterNavigationBar.buttons["Add"]
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
    
    func testUIDummy() {
        
        let labelByTextQuery = app.staticTexts["Label"]
        XCTAssertTrue(labelByTextQuery.exists)

        
    }
    
}
