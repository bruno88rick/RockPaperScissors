//
//  GameBackEnd.swift
//  RockPaperScissors
//
//  Created by Bruno Oliveira on 27/12/23.
//

import Foundation

struct GameBackEnd {
    
    var totalScore = 0
    var gameMatch = 0
    
    func elementTapped (userChoose: Int, opponentChoose: Int) -> MatchResult {
        
        switch userChoose {
        case Elements.Paper.rawValue:
            if opponentChoose == Elements.Paper.rawValue {
                return MatchResult.tie
            } else if opponentChoose == Elements.Rock.rawValue {
                return MatchResult.victory
            } else {
                return MatchResult.loose
            }
        case Elements.Rock.rawValue:
            if opponentChoose == Elements.Paper.rawValue {
                return MatchResult.loose
            } else if opponentChoose == Elements.Rock.rawValue {
                return MatchResult.tie
            } else {
                return MatchResult.victory
            }
        case Elements.Scissors.rawValue:
            if opponentChoose == Elements.Paper.rawValue {
                return MatchResult.victory
            } else if opponentChoose == Elements.Rock.rawValue {
                return MatchResult.loose
            } else {
                return MatchResult.tie
            }
        default: return MatchResult.error
        }
    }
}
