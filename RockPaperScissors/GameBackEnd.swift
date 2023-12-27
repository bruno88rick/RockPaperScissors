//
//  GameBackEnd.swift
//  RockPaperScissors
//
//  Created by Bruno Oliveira on 27/12/23.
//

import Foundation

enum elements: Int {
    case Paper = 0
    case Rock = 1
    case Scissors = 2
}

struct Game {
    
    func UserIstheWinner (userChoose: Int, opponentChoose: Int) -> Bool {
        
        switch userChoose {
        case elements.Paper.rawValue:
            if opponentChoose == elements.Paper.rawValue {
                
            } else if opponentChoose == elements.Rock.rawValue {
                
            } else if opponentChoose == elements.Scissors.rawValue {
                
            } else {
                
            }
        case elements.Rock.rawValue:
            if opponentChoose == elements.Paper.rawValue {
                
            } else if opponentChoose == elements.Rock.rawValue {
                
            } else if opponentChoose == elements.Scissors.rawValue {
                
            } else {
                
            }
        case elements.Scissors.rawValue:
            if opponentChoose == elements.Paper.rawValue {
                
            } else if opponentChoose == elements.Rock.rawValue {
                
            } else if opponentChoose == elements.Scissors.rawValue {
                
            } else {
                
            }
        default: break
        }
        return true
        
    }
    
}
