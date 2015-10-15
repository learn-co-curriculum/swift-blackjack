//
//  Deck.swift
//  swift-blackjack
//
//  Created by Mark Murray on 10/14/15.
//  Copyright © 2015 Flatiron School. All rights reserved.
//

import Foundation

class Deck: CustomDebugStringConvertible {
    private var remainingCards : [Card]
    private var dealtCards : [Card]
    
    var debugDescription: String { return self.getDebugDescription() }
    
    init () {
        var cards : [Card] = []
        for suit in Card.validSuits() {
            for rank in Card.validRanks() {
                let card = Card.init(suit: suit, rank: rank)
                cards.append(card)
            }
        }
        remainingCards = cards
        dealtCards = []
    }
    
    func getDebugDescription() -> String {
        var debug = "Deck"
        debug += "\n  remainingCards: "
        debug += descriptionForCardArray(remainingCards)
        debug += "\n  dealtCards: "
        debug += descriptionForCardArray(dealtCards)
        
        return debug
    }
    
    
    func drawCard() -> Card {
        let card = remainingCards.removeFirst()
        self.dealtCards.append(card)
        return card
    }
    
    func shuffle() {
        self.remainingCards.appendContentsOf(dealtCards)
        self.dealtCards.removeAll()
        self.reshuffle()
    }
    
    func reshuffle() {
        var shuffledCards : [Card] = []
        
        let limit = remainingCards.count
        
        for var count = 0; count < limit; count++ {
            let randomIndex = Int(arc4random_uniform(UInt32(remainingCards.count)))
            
            let randomCard = remainingCards.removeAtIndex(randomIndex)
            shuffledCards.append(randomCard)
        }
        
        self.remainingCards = shuffledCards
    }
}

// where does this module function belong?
func descriptionForCardArray(cardArray: [Card]) -> String {
    var description = "\(cardArray.count)"
    var count = 0
    for card in cardArray {
        if count % 13 == 0 {
            description += "\n   "
        }
        description += " \(card.debugDescription)"
        count++
    }
    return description
}

