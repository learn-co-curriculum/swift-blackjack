//
//  Dealer.swift
//  swift-blackjack
//
//  Created by Mark Murray on 10/14/15.
//  Copyright © 2015 Flatiron School. All rights reserved.
//

import Foundation

class Dealer {
    let deck = Deck.init()
    let house = House.init(name: "House")
    let player = House.init(name: "Player")
    var bet: UInt = 0
    
    func placeBet(bet: UInt) -> Bool {
        if house.canPlaceBet(bet) && player.canPlaceBet(bet) {
            self.bet = bet
            return true
        } else {
            self.bet = 0
            return false
        }
    }
        
    func deal() {
        deck.shuffle()
        player.stayed = false
        house.stayed = false
        
        for var i = 0; i < 2; i++ {
            player.cards.append(deck.drawCard())
            house.cards.append(deck.drawCard())
        }
    }
    
    func playerTurn() {
        if player.mayHit() {
            print("Player's turn")
            if player.mustHit() {
                player.cards.append(deck.drawCard())
                print("Player hits!")
                print(player)
            } else {
                player.stayed = true
                print("Player stays!")
            }
        }
    }
    
    func houseTurn() {
        if house.mayHit() {
            print("House's turn:")
            if house.mustHit() {
                house.cards.append(deck.drawCard())
                print("House hits!")
                print(house)
            } else {
                house.stayed = true
                print("House stays!")
            }
        }
    }
    
    func winner() -> String {
        if player.blackjack && house.blackjack {
            return "push"
        }
        if player.blackjack && !house.blackjack {
            return "player"
        }
        if !player.blackjack && house.blackjack {
            return "house"
        }
        if player.busted {
            return "house"
        }
        if house.busted {
            return "player"
        }
        if player.cards.count == 5 {
            return "player"
        }
        if house.stayed && player.stayed {
            if player.handscore > house.handscore {
                return "player"
            } else {
                return "house"
            }
        }
        return "no"
    }
    
    func award() -> String {
        let winner = self.winner()
        switch winner {
            case "push":
                house.didPush()
                player.didPush()
                return "Push!"
            case "house":
                house.didWin(bet)
                player.didLose(bet)
                return "House wins \(bet)!"
            case "player":
                house.didLose(bet)
                player.didWin(bet)
                return "Player wins \(bet)!"
            case "no":
                return "There is not a winner yet."
            default:
                return "ERROR award: \(winner)"
        }
    }
}



