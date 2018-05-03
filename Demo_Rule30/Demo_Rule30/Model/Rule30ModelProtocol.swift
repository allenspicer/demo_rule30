//
//  Rule30ModelProtocol.swift
//  Demo_Rule30
//
//  Created by uBack on 5/3/18.
//  Copyright © 2018 rule30Demo. All rights reserved.
//

import Foundation

protocol Rule30ModelProtocol {
    
    func isCellTrue(_ previousRowArrayOfBools : [Bool], indexForCell : Int ) -> Bool?
    
    func getRow(_ rowIndex :Int ) -> [Bool]?
    
    func generateRowsAndReturnCount () -> Int

}


