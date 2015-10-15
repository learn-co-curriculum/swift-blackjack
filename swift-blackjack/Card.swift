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
    private(set) var cardLabel = ""
    private(set) var cardValue: UInt = 0
    
    var debugDescription: String { return cardLabel }
    
    init (suit: String, rank: String) {
        self.suit = suit
        self.rank = rank
        self.cardLabel = "\(suit)\(rank)"
        self.cardValue = determineCardValue(rank)
    }
    
    class func validSuits() -> [String] {
        return ["♠︎", "♥︎", "♦︎", "♣︎"]
    }
    
    class func validRanks() -> [String] {
        return ["A", "2", "3" ,"4", "5", "6", "7", "8", "9", "10", "J", "Q", "K"]
    }

    func determineCardValue(rank: String) -> UInt {
        switch rank {
        case "A":
            return 1
        case "2", "3", "4", "5", "6", "7", "8", "9", "10":
            return UInt(rank)!
        case "J", "Q", "K":
            return 10
        default:
            return 0
        }
    }
}
