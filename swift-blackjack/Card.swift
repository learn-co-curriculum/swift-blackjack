//
//  Card.swift
//  swift-blackjack
//
//  Created by Mark Murray on 10/14/15.
//  Copyright © 2015 Flatiron School. All rights reserved.
//

import Foundation

class Card: CustomDebugStringConvertible {
    let suit : String
    let rank : String
    var cardLabel = ""
    var cardValue = 0
    
    var debugDescription = ""
    
    init (suit: String, rank: String) {
        self.suit = suit
        self.rank = rank
        self.cardLabel = "\(suit)\(rank)"
        self.cardValue = determineCardValue(rank)
        
        self.debugDescription = self.cardLabel
    }
    
    class func validSuits() -> [String] {
        return ["♠︎", "♥︎", "♦︎", "♣︎"]
    }
    
    class func validRanks() -> [String] {
        return ["A", "2", "3" ,"4", "5", "6", "7", "8", "9", "10", "J", "Q", "K"]
    }

    func determineCardValue(rank: String) -> Int {
        switch rank {
        case "A":
            return 1
        case "2", "3", "4", "5", "6", "7", "8", "9", "10":
            return Int(rank)!
        case "J", "Q", "K":
            return 10
        default:
            return 0
        }
    }
}
