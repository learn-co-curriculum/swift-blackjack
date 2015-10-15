//
//  DealerSpec.swift
//  swift-blackjack
//
//  Created by Mark Murray on 10/15/15.
//  Copyright © 2015 Flatiron School. All rights reserved.
//

import Quick
import Nimble
@testable import swift_blackjack

class DealerSpec: QuickSpec {
    override func spec() {
        describe("Dealer") {
            
            var dealer = Dealer()
            
            beforeEach({ () -> () in
                dealer = Dealer()
            })
            
            describe("placeBet") {
                it("should return true if the house and player can afford a bet of 10") {
                    let bet : UInt = 10
                    
                    expect(dealer.placeBet(bet)).to(beTrue())
                }
                
                it("should set the dealer's bet property to 10 when the value of the bet parameter is 10") {
                    let bet : UInt = 10
                    dealer.placeBet(bet)
                    
                    expect(dealer.bet).to(equal(bet))
                }
                
                it("should set the dealer's bet property to 20 when the value of the bet parameter is 20") {
                    let bet : UInt = 20
                    dealer.placeBet(bet)
                    
                    expect(dealer.bet).to(equal(bet))
                }
                
                it("should return false if the bet exceeds the player's wallet") {
                    let bet = dealer.player.wallet + 1
                    
                    expect(dealer.placeBet(bet)).to(beFalse())
                }
                
                it("should return false if the bet exceeds the house's wallet") {
                    let bet = dealer.house.wallet + 1
                    
                    expect(dealer.placeBet(bet)).to(beFalse())
                }
            }
            
            describe("deal") {
                it("") {
                    
                }
            }

            describe("playerTurn") {
                it("") {
                    
                }
            }

            describe("houseTurn") {
                it("") {
                    
                }
            }
            
            describe("winner") {
                it("") {
                    
                }
            }

            describe("award") {
                it("") {
                    
                }
            }

        }
    }
}

