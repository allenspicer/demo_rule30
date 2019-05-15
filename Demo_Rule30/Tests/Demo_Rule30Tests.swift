//
//  Demo_Rule30Tests.swift
//  Demo_Rule30Tests
//
//  Created by Allen Spicer on 5/3/18.
//  Copyright © 2018 rule30Demo. All rights reserved.
//

import XCTest
@testable import Demo_Rule30

class Demo_Rule30Tests: XCTestCase {
    
    var model : Rule30Model!
    var vc : ViewController!

    
    override func setUp() {
        super.setUp()
        model = Rule30Model()

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        vc = storyboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func test_model_returns_false_scenario_one(){
        let bool = model.isCellTrue([true,true,true], indexForCell: 1)
        XCTAssert(bool == false)
    }
    
}
