//
//  Demo_Rule30_VC_Tests.swift
//  Demo_Rule30_VC_Tests
//
//  Created by Allen Spicer on 5/3/18.
//  Copyright © 2018 rule30Demo. All rights reserved.
//

import XCTest
@testable import Demo_Rule30

class Demo_Rule30_CPV_Tests: XCTestCase {
    
    var colorPickerView : ColorPickerView!
    
    override func setUp() {
        super.setUp()
        colorPickerView = ColorPickerView()
    }
    
    override func tearDown() {
        colorPickerView = nil
        super.tearDown()
    }

    func test_color_update(){
        //GIVEN
        let touch = UITouch()
        
        //WHEN
        colorPickerView.updateColor(touch: touch)
        
        //THEN
        XCTAssertNotNil(colorPickerView.selectedColor)
    }
}
