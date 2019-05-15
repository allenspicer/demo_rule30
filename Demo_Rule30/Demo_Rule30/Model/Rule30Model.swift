//
//  Rule30Model.swift
//  Demo_Rule30
//
//  Created by Allen Spicer on 5/3/18.
//  Copyright © 2018 rule30Demo. All rights reserved.
//

import Foundation


final class Rule30Model : Rule30ModelProtocol {
    
    internal var displayDataDictionary = [Int:[Bool]]()
    internal var modelDataDictionary = [Int:[Bool]]()
    
     func generateRowsAndReturnCount () -> Int{
        modelDataDictionary = generateRows(numberOfRowsToGenerate: 200, numberOfColumnsToGenerate: 200)
        
        displayDataDictionary =  modelDataDictionary
        
        //we have generated 60 columns for the data model but here we limit the
        // number of columns displayed to remove interference from the edges of the view
        for i in displayDataDictionary {
            var cellCount = i.value.count
            while cellCount > 21 {
                if var row = displayDataDictionary[i.key]{
                    let index = (row.count) - 1
                    row.remove(at: index)
                    row.remove(at: 0)
                    displayDataDictionary[i.key] = row
                    cellCount -= 2
                }
            }
        }
        
        //we could limit rows as well by uncommenting this code
//        for num in displayDataDictionary where num.key > 50{
//            displayDataDictionary.removeValue(forKey: num.key)
//        }
        
        return displayDataDictionary.count
    }

     func getRow(_ rowIndex :Int ) -> [Bool]?{
        
        //check that the requested index is contained in the dataset
        if rowIndex < displayDataDictionary.count - 1{
            if let row = displayDataDictionary[rowIndex]{
                return row
            }
        }
        return nil
    }
    
    private func generateRows( numberOfRowsToGenerate: Int, numberOfColumnsToGenerate: Int) -> [Int:[Bool]]{
        
        // if data has not already been generated
        if (displayDataDictionary.count == 0){
        
            //split total to create a first row with just one true value in the middle
            //and all other values set to false
            let oneSideOfColumns = (numberOfColumnsToGenerate) / 2
            let firstRow = [ 0 : [Bool](repeating: false, count: oneSideOfColumns) + [true] + [Bool](repeating: false, count: oneSideOfColumns)]
            displayDataDictionary = firstRow
            
            //generate rows after this inital row
            for x in 1...numberOfRowsToGenerate{
                var rowArray = [Bool]()
                
                for y in 0...numberOfColumnsToGenerate{
                    guard let previousRow = displayDataDictionary[x-1] else {return displayDataDictionary}
                    guard let cellBoolValue = isCellTrue(previousRow, indexForCell: y) else {return displayDataDictionary}
                    rowArray.append(cellBoolValue)
                }
                displayDataDictionary[x] = rowArray
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
