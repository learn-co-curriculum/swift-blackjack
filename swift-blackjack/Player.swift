//
//  Player.swift
//  swift-blackjack
//
//  Created by Mark Murray on 10/14/15.
//  Copyright © 2015 Flatiron School. All rights reserved.
//

import Foundation

class Player: CustomDebugStringConvertible {
    let name : String
    var cards : [Card] = []
    
    var handscore: UInt { return self.getHandscore() }
    var blackjack: Bool { return self.isBlackjack() }
    var busted: Bool { return self.isBusted() }
    
    var stayed: Bool = false
    private(set) var wallet: UInt = 100
    var bet: UInt = 10

    var debugDescription: String { return self.getDebugDescription() }
    
    init(name: String) {
        self.name = name
    }
    
    func getDebugDescription() -> String{
        var debug = "Player: \(self.name)"
        debug += "\n  cardsInHand: "
        debug += descriptionForCardArray(self.cards)
        debug += "\n  handscore: \(self.handscore)"
        return debug
    }
    
    func getHandscore() -> UInt {
        var score: UInt = 0
        
        for card in cards {
            score += card.cardValue
        }
        if self.hasAce() && handscore <= 11 {
            score += 10
        }
        return score
    }
    
    private func hasAce() -> Bool {
        for card in cards {
            if card.rank == "A" {
                return true
            }
        }
        return false
    }
    
    func isBlackjack() -> Bool {
        return handscore == 21 && cards.count == 2
    }
    
    func isBusted() -> Bool {
        return handscore > 21
    }
    
    func canPlaceBet() -> Bool {
        return wallet > bet
    }
    
    func mayHit() -> Bool {
        return !blackjack && !busted && !stayed
    }
    
    func didWin() {
        wallet += bet
    }
    
    func didLose() {
        wallet -= bet
    }
    
    func didPush() {
        // no action
    }
}

