//
//  Demo_Rule30_Model_Tests.swift
//  Demo_Rule30_Model_Tests
//
//  Created by Allen Spicer on 5/3/18.
//  Copyright © 2018 rule30Demo. All rights reserved.
//

import XCTest
@testable import Demo_Rule30

class Demo_Rule30_Model_Tests: XCTestCase {
    
    var model : Rule30Model!
    
    override func setUp() {
        super.setUp()
        model = Rule30Model()
    }
    
    override func tearDown() {
        model = nil
        super.tearDown()
    }
    
    func test_create_data_return_column_count() {
        //WHEN
        let columns = model.createModelAndDisplayDataAndReturnColumns()
        
        //THEN
        XCTAssertEqual(200, columns)
    }
    
    func test_get_row(){
        //GIVEN
        let firstRow = 0
        let rows = 2
        let columns = 2
        
        //WHEN
        model.displayDataDictionary = model.generateRows(numberOfRowsToGenerate: rows, numberOfColumnsToGenerate: columns)
        
        let row = model.getRow(firstRow)
        
        //THEN
        XCTAssertNotNil(row)
    }
    
    func test_generate_rows(){
        //GIVEN
        let rows = 3
        let columns = 3
        
        //WHEN
        let generatedData = model.generateRows(numberOfRowsToGenerate: rows, numberOfColumnsToGenerate: columns)
        
        //THEN
        XCTAssert(generatedData.count == 3)
        XCTAssert(generatedData[0].count == 3)
        XCTAssert(generatedData[1].count == 3)
        XCTAssert(generatedData[2].count == 3)
    }
    
    func test_cell_value_scenario_one(){
        
        //GIVEN
        let previousRow = [true,true,true]
        let index = 1
        
        //WHEN
        let bool = model.isCellTrue(previousRow, indexForCell: index)
        
        //THEN
        XCTAssert(bool == false)
    }
    
}
