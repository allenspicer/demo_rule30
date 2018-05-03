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
        
        return data.count
    }

    func getRow(_ rowIndex :Int ) -> [Bool]?{
        
        //check that the requested index is contained in the dataset
        return nil
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
        if (a && !b && c){ return false}
        if (a && !b && !c){ return true}
        if (!a && b && c){ return true}
        if (!a && b && !c){ return true}
        if (!a && !b && c){ return true}
        if (!a && !b && !c){ return false}
        
        return nil
    }

    
}
