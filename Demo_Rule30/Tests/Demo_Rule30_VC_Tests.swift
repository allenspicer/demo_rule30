//
//  Demo_Rule30_VC_Tests.swift
//  Demo_Rule30_VC_Tests
//
//  Created by Allen Spicer on 5/3/18.
//  Copyright © 2018 rule30Demo. All rights reserved.
//

import XCTest
@testable import Demo_Rule30

class Demo_Rule30_VC_Tests: XCTestCase {
    
    var viewController : ViewController!
    
    override func setUp() {
        super.setUp()
        viewController = ViewController()
        viewController.tableView = UITableView()
    }
    
    override func tearDown() {
        viewController = nil
        super.tearDown()
    }
    
    func test_populate_table(){
        //WHEN
        viewController.createDataAndLoadTableView()
        
        //THEN
        XCTAssertEqual(viewController.model.displayDataDictionary.count, viewController.numberOfRows)
    }
    
    func test_arrayOfViews(){
        //GIVEN
        let arrayOfBools = [true,true,true]
        
        //WHEN
        let arrayOfViews = viewController.arrayOfViews(arrayOfBools)
        
        //THEN
        XCTAssert(arrayOfViews.count == 3)
    }
    
    func test_color_complement(){
        //GIVEN
        let initialColor = UIColor.black
        
        //WHEN
        let convertedColor = viewController.colorComplement(color: initialColor)
        let ciColor = CIColor(color: convertedColor)
        let red = ciColor.red
        let blue = ciColor.red
        let green = ciColor.red

        
        //THEN
        let complement = CIColor(color: .white)
        XCTAssert(red == complement.red)
        XCTAssert(blue == complement.blue)
        XCTAssert(green == complement.green)
    }
    
}
