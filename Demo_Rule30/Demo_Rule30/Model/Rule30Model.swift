//
//  Rule30Model.swift
//  Demo_Rule30
//
//  Created by uBack on 5/3/18.
//  Copyright © 2018 rule30Demo. All rights reserved.
//

import Foundation


class Rule30Model : Rule30ModelProtocol {
    
    var data = [Int:[Bool]]()
    
    func generateRowsAndReturnCount () -> Int{
        data = generateRows(numberOfRowsToGenerate: 49, numberOfColumnsToGenerate: 21)
        return data.count
    }

    func getRow(_ rowIndex :Int ) -> [Bool]?{
        
        //check that the requested index is contained in the dataset
        if rowIndex < data.count - 1{
            if let row = data[rowIndex]{
                return row
            }
        }
        return nil
    }
    
    func generateRows( numberOfRowsToGenerate: Int, numberOfColumnsToGenerate: Int) -> [Int:[Bool]]{
        
        // if data has not already been generated
        if (data.count == 0){
        
            //split total to create a first row with just one true value in the middle
            //and all other values set to false
            let oneSideOfColumns = (numberOfColumnsToGenerate - 1) / 2
            let firstRow = [ 0 : [Bool](repeating: false, count: oneSideOfColumns) + [true] + [Bool](repeating: false, count: oneSideOfColumns)]
            data = firstRow
            
            //generate rows after this inital row
            for x in 1...numberOfRowsToGenerate{
                var rowArray = [Bool]()
                
                for y in 0...numberOfColumnsToGenerate{
                    guard let previousRow = data[x-1] else {return data}
                    guard let cellBoolValue = isCellTrue(previousRow, indexForCell: y) else {return data}
                    rowArray.append(cellBoolValue)
                }
                data[x] = rowArray
            }
        }
        return data
    }
    
    func isCellTrue(_ previousRowArrayOfBools : [Bool], indexForCell : Int ) -> Bool?{
        
        //if the cell in question is on the edge
        //we return false for the cell value
        //this is a catch all to allow the function logic to work
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
