//
//  OXGame.swift
//  NoughtsAndCrosses
//
//  Created by Ryan Davey on 5/30/16.
//  Copyright © 2016 Julian Hulme. All rights reserved.
//

import Foundation



class OXGame {
    
    // create empty board
    private var board = [CellType](count: 9, repeatedValue : CellType.EMPTY)
    
    private var startType = CellType.X
    
    // declare cases for cell types
    enum CellType:String {
        case O = "O"
        case X = "X"
        case EMPTY = ""
    }
    
    enum OXGameState:String {
        case inProgress
        case complete_no_one_won
        case complete_someone_won
    }
    
    private var count:Int = 0
    
    func turn() -> Int {
        return count
    }
    func playMove() {
        count++
    }
    func whosTurn() -> CellType {
        if count % 2 == 0 {
           return CellType.X
        }
        else {
            return CellType.O
        }
        
    }
    
}