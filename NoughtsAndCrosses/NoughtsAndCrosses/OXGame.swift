//
//  OXGame.swift
//  NoughtsAndCrosses
//
//  Created by Ryan Davey on 5/30/16.
//  Copyright © 2016 Julian Hulme. All rights reserved.
//

import Foundation

private let max_turns = 9

    // declare cases for cell types
enum CellType:String {
    case O = "O"
    case X = "X"
    case EMPTY = ""
}

//declares cases for game types
enum OXGameState:String {
    case inProgress
    case complete_no_one_won
    case complete_someone_won
}

class OXGame {
    
    var hostUser: User?
    var guestUser: User?
    
    var backendState: OXGameState?
    
    var gameId: String?
    
    // create empty board
    var board = [CellType](count: max_turns, repeatedValue : CellType.EMPTY)
    
    private var startType = CellType.X
    
    private var count:Int = 0
    
    // updates number of turns
    func turn() -> Int {
        return count
    }
    // returns whether X or O turn to move
    func whosTurn()  -> CellType {
        let count = turn()
        if (count % 2 == 0)   {
            return startType
        }   else    {
            if (startType == CellType.X)    {
                return CellType.O
            }   else    {
                return CellType.X
            }
        }
        
    }
    
    // returns type in specifc cell
    func typeIndex(cell: Int) -> CellType {
        return board[cell]
    }
    // increments number of turns and changes player to move
    func playMove(cell: Int) -> CellType {
        board[cell] = whosTurn()
        count += 1
        return board[cell]
    }
    // detects whether 3 cells in a row/column/diagonal are the same
    func winDetection() -> Bool {
           // sideways
        if ((board[0] == board[1]) && (board[1] == board[2]) && (board[0] != CellType.EMPTY)){
            print("a")
            return true
        } else if (board[3] == board[4]) && (board[4] == board[5]) && (board[3] != CellType.EMPTY) {
            print("b")
            return true
        } else if (board[6] == board[7]) && (board[7] == board[8]) && (board[6] != CellType.EMPTY) {
            print("c")
          return true
        } else if (board[0] == board[3]) && (board[3] == board[6]) && (board[0] != CellType.EMPTY) {
            print("d")
            return true
        } else if (board[1] == board[4]) && (board[4] == board[7]) && (board[1] != CellType.EMPTY) {
            print("e")
            return true
        } else if (board[2] == board[5]) && (board[5] == board[8]) && (board[2] != CellType.EMPTY) {
            print("f")
            return true
        } else if (board[0] == board[4]) && (board[4] == board[8]) && (board[0] != CellType.EMPTY) {
            print("g")
            return true
        } else if (board[6] == board[4]) && (board[4] == board[2]) && (board[6] != CellType.EMPTY) {
            print("h")
            return true
        } else {
            print("i")
            return false
        }
    }
    // updates game state based on win detection and number of turns completed
    func state() -> OXGameState {
        if winDetection() {
            return OXGameState.complete_someone_won
        }
        else if (!winDetection()) && (count < max_turns) {
            return OXGameState.inProgress
        }
        else {
            return OXGameState.complete_no_one_won
        }
    }
    // resets the board to 9 blank squares
    func reset() {
        for cell in 0...8 {
            board[cell] = CellType.EMPTY
        }
    }
    
}
