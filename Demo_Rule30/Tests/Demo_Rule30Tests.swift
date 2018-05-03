//
//  Demo_Rule30Tests.swift
//  Demo_Rule30Tests
//
//  Created by uBack on 5/3/18.
//  Copyright © 2018 rule30Demo. All rights reserved.
//

import XCTest
@testable import Demo_Rule30

class Demo_Rule30Tests: XCTestCase {
    
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
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    
    func test_model_returns_false_scenario_one(){
        let model = Rule30Model()
        let bool = model.isCellTrue()
        XCTAssert(bool == false)
    }
    
}
