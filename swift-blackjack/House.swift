//
//  House.swift
//  swift-blackjack
//
//  Created by Mark Murray on 10/14/15.
//  Copyright © 2015 Flatiron School. All rights reserved.
//

import Foundation

class House: Player {
    override init(name: String) {
        super.init(name: name)
        wallet = 1000
    }
    
    func mustHit() -> Bool {
        return handscore <= 16
    }
}

