//
//  Rule30Model.swift
//  Demo_Rule30
//
//  Created by Allen Spicer on 5/3/18.
//  Copyright © 2018 rule30Demo. All rights reserved.
//

import Foundation


final class Rule30Model : Rule30ModelProtocol {
    
    internal var displayDataDictionary = [[Bool]]()
    internal var modelDataDictionary = [[Bool]]()
    
     func createModelAndDisplayDataAndReturnColumns() -> Int{
        modelDataDictionary = generateRows(numberOfRowsToGenerate: 200, numberOfColumnsToGenerate: 200)
        displayDataDictionary =  modelDataDictionary
        
        //we have generated 60 columns for the data model but here we limit the
        // number of columns displayed to remove interference from the edges of the view
        for (index, rowArray) in displayDataDictionary.enumerated() {
            let middle = rowArray.count/2
            displayDataDictionary[index] = Array(rowArray[middle - 10...middle + 10])
        }
        
        return displayDataDictionary.count
    }

     func getRow(_ rowIndex :Int ) -> [Bool]?{
        
        //check that the requested index is contained in the dataset
        if rowIndex < displayDataDictionary.count - 1{
            return displayDataDictionary[rowIndex]
        }
        return nil
    }
    
     func generateRows(numberOfRowsToGenerate: Int, numberOfColumnsToGenerate: Int) -> [[Bool]]{
        
        // if data has not already been generated
        if (displayDataDictionary.count == 0){
        
            //split total to create a first row with just one true value in the middle
            //and all other values set to false
            let oneSideOfColumns = (numberOfColumnsToGenerate) / 2
            let firstRow = [[Bool](repeating: false, count: oneSideOfColumns) + [true] + [Bool](repeating: false, count: oneSideOfColumns)]
            displayDataDictionary = firstRow
            
            //generate rows after this inital row
            for x in 1..<numberOfRowsToGenerate{
                var rowArray = [Bool]()
                
                for y in 0..<numberOfColumnsToGenerate{
                    if x-1 > displayDataDictionary.count - 1 {return displayDataDictionary}
                    let previousRow = displayDataDictionary[x-1]
                    guard let cellBoolValue = isCellTrue(previousRow, indexForCell: y) else {return displayDataDictionary}
                    rowArray.append(cellBoolValue)
                }
                displayDataDictionary.append(rowArray)
            }
        }

        return displayDataDictionary
    }
    
    internal func isCellTrue(_ previousRowArrayOfBools : [Bool], indexForCell : Int ) -> Bool?{
        
        //if the cell in question is on the edge
        //we return false for the cell value
        //this is a catch all to allow the private function logic to work
        if (indexForCell + 1 > previousRowArrayOfBools.count - 1 || indexForCell - 1 < 0){
            return false
        }
        
        //rename for brevity
        let a = previousRowArrayOfBools[indexForCell - 1]
        let b = previousRowArrayOfBools[indexForCell]
        let c = previousRowArrayOfBools[indexForCell + 1]
        
        //scenario one: all cells above are true
        if (a && b && c){ return false}
        
        //all other scenarios
        if (a && b && !c){ return false}
        if (a && !b && c){ return false}
        if (a && !b && !c){ return true}
        if (!a && b && c){ return true}
        if (!a && b && !c){ return true}
        if (!a && !b && c){ return true}
        if (!a && !b && !c){ return false}
        
        return nil
    }

    
}
