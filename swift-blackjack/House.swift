//  House.swift

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

