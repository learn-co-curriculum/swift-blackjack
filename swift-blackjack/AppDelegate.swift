//  AppDelegate.swift

import UIKit


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    /**

     * Declare any custom properties here.

     */
    
    let dealer = Dealer()

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        /**
        
         * Call your custom classes here when running the scheme.
        
         */
        
//        let deck = Deck.init()
//        print(deck)
//        
//        deck.shuffle()
//        print(deck)

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
        
        self.playBlackjack(20)
        
        // Do not alter
        return true  //
    }   ///////////////
    
    /**

     * Write your playBlackjack method in here
    
     */
    
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

// do not delete
} //////////////

