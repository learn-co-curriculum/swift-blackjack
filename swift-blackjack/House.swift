//
//  House.swift
//  swift-blackjack
//
//  Created by Mark Murray on 10/14/15.
//  Copyright © 2015 Flatiron School. All rights reserved.
//

import Foundation

class House: Player {
    
    func mustHit() -> Bool {
        return self.handscore <= 17
    }
}


