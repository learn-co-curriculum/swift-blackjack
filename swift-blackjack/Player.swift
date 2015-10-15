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
    
    var wallet: UInt = 100

    var debugDescription: String { return self.getDebugDescription() }
    
    init(name: String) {
        self.name = name
    }
    
    func getDebugDescription() -> String{
        var debug = "Player: \(name)"
        debug += "\n  cardsInHand: "
        debug += descriptionForCardArray(cards)
        debug += "\n  handscore: \(handscore)"
        debug += "\n    blackjack: \(blackjack)"
        debug += "\n    busted   : \(busted)"
        debug += "\n    stayed   : \(stayed)"
        debug += "\n    wallet: \(wallet)"
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
        // this for-in loop causes intermittent crashes (infinite multithreading)
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
    
    func mayHit() -> Bool {
        return !blackjack && !busted && !stayed
    }
    
    func canPlaceBet(bet: UInt) -> Bool {
        return wallet >= bet
    }
    
    func didWin(bet: UInt) {
        wallet += bet
    }
    
    func didLose(bet: UInt) {
        wallet -= bet
    }
    
    func didPush() {
        // no action
    }
}

