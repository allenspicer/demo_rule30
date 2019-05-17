//
//  Demo_Rule30_UI_Tests.swift
//  Demo_Rule30_UI_Tests
//
//  Created by Allen Spicer on 5/16/19.
//  Copyright © 2019 rule30Demo. All rights reserved.
//

import XCTest

class Demo_Rule30_UI_Tests: XCTestCase {
    
    var app: XCUIApplication!

    override func setUp() {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }

    override func tearDown() {
        app = nil
    }

    func test_color_picker_touch() {
        //GIVEN
        let colorPicker = app.otherElements.containing(.staticText, identifier:"Rule 30 Cellular Automata").children(matching: .other).element
        
        //WHEN
        colorPicker.tap()
        
        //THEN
        XCTAssertTrue(colorPicker.isHittable)
    }

}
