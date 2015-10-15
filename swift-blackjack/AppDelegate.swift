//
//  AppDelegate.swift
//  swift-blackjack
//
//  Created by Mark Murray on 10/14/15.
//  Copyright © 2015 Flatiron School. All rights reserved.
//

import UIKit


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let dealer = Dealer()

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
//        let deck = Deck.init()
//        print(deck)
//        
//        deck.shuffle()
//        print(deck)
//        
////        for var count = 0; count < 52; count++ {
////            let card = deck.drawNextCard()
////            print("card \(card)")
////            print(deck)
////        }
//        
//        let house = House.init(name: "House")
//        
//        house.cards.append(deck.drawCard())
//        house.cards.append(deck.drawCard())
//        print(house)
//        
//        while house.mustHit() {
//            house.cards.append(deck.drawCard())
//            print(house)
//        }
        //self.playBlackjack(20)
        
        return true
    }
    
    func playBlackjack(bet: UInt) {
        let goodBet = dealer.placeBet(bet)
        if !goodBet {
            return
        }
        print("The bet is \(bet)")
        
        print("Deal!")
        dealer.deal()
        print(dealer.house)
        print(dealer.player)
        
        for var i = 2; i < 5; i++ {
            dealer.playerTurn()
            if !dealer.player.busted {
                dealer.houseTurn()
            }
        }
        
        print("--End of the hand--")
        let award = dealer.award()
        print(award)
        print(dealer.house)
        print(dealer.player)
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

