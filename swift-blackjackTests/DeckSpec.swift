//
//  DeckSpec.swift
//  swift-blackjack
//
//  Created by Mark Murray on 10/15/15.
//  Copyright © 2015 Flatiron School. All rights reserved.
//

import Quick
import Nimble
@testable import swift_blackjack

class DeckSpec: QuickSpec {
    override func spec() {
        describe("Deck") {
            
            var deck : Deck = Deck()
            
            beforeEach({ () -> () in
                deck = Deck()
            })
            
            describe("initializer") {
                it("should set up the deck with 52 undealt cards") {
                    expect(deck.debugDescription).to(contain("remainingCards: 52"))
                    expect(deck.debugDescription).to(contain("dealtCards: 0"))
                }
            }
            
            describe("drawCard") {
                it("should return an ace of spades from a fresh deck") {
                    let card = deck.drawCard()
                    
                    expect(card.cardLabel).to(match("♠︎A"))
                }
            }
            
            describe("shuffle") {
                it("should change the order of the cards") {
                    deck.shuffle()
                    let card = deck.drawCard()
                    
                    expect(card.cardLabel).notTo(match("♠︎A"))
                }
            }
            
            describe("reshuffle") {
                it("should change the order of the cards without including dealt cards") {
                    let card = deck.drawCard()
                    deck.reshuffle()
                    let newCard = deck.drawCard()
                    
                    expect(card.cardLabel).to(match("♠︎A"))
                    expect(newCard.cardLabel).notTo(match("♠︎2"))
                    expect(deck.debugDescription).to(contain("remainingCards: 50"))
                }
            }
        }
    }
}

