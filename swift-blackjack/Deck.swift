//
//  Deck.swift
//  swift-blackjack
//
//  Created by Mark Murray on 10/14/15.
//  Copyright © 2015 Flatiron School. All rights reserved.
//

import Foundation

class Deck: CustomDebugStringConvertible {
    var remainingCards : [Card]
    var dealtCards : [Card]
    
    var debugDescription = ""
    
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
        
        self.updateDebugDescription()
    }
    
    func updateDebugDescription() {
        debugDescription = "Deck"
        
        debugDescription += "\n  remainingCards: "
        debugDescription += self.descriptionForCardArray(self.remainingCards)
        
        debugDescription += "\n  dealtCards: "
        debugDescription += self.descriptionForCardArray(self.dealtCards)
    }
    
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
    
    func drawNextCard() -> Card {
        let card = self.remainingCards.removeFirst()
        self.dealtCards.append(card)
        self.updateDebugDescription()
        return card
    }
    
    func resetDeck() {
        self.gatherDealtCards()
        self.shuffleRemainingCards()
        self.updateDebugDescription()
    }
    
    private func gatherDealtCards() {
        self.remainingCards.appendContentsOf(self.dealtCards)
        self.dealtCards.removeAll()
    }
    
    private func shuffleRemainingCards() {
        var shuffledCards : [Card] = []
        
        let limit = self.remainingCards.count
        
        for var count = 0; count < limit; count++ {
            let randomIndex = Int(arc4random_uniform(UInt32(self.remainingCards.count)))
            
            let randomCard = self.remainingCards.removeAtIndex(randomIndex)
            shuffledCards.append(randomCard)
        }
        
        self.remainingCards = shuffledCards
    }
}
